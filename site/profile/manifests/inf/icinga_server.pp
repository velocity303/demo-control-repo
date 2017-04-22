class profile::inf::icinga_server {
  include profile::baseline::epel
  include apache
  include apache::mod::php
  include apache::mod::prefork

  File{
    require => Host['puppet'],
  }

  class { 'mysql::server':
    override_options   => {
      'mysqld'         => {
        'bind-address' => '0.0.0.0',
        'port'         => 3306,
      },
    },
  }

  class { '::icinga2':
    manage_repo => true,
    features  => ['checker','mainlog','notification','statusdata','compatlog','command'],
  }

  class { '::icinga2::feature::idomysql':
    user          => 'icinga',
    password      => 'icinga',
    database      => 'icinga',
    import_schema => true,
    require       => Mysql::Db['icinga']
  }

  mysql::db { 'icinga':
    user     => 'icinga',
    password => 'icinga',
    grant    => ['ALL'],
    before   => Class['icinga2'],
  }
  mysql::db { 'icingaweb2':
    user     => 'icingaweb2',
    password => 'icinga2',
    grant    => ['ALL'],
  }
  ini_setting { 'date timezone setting':
    ensure  => present,
    path    => '/etc/php.ini',
    section => 'Date',
    setting => 'date.timezone',
    value   => 'America/Chicago',
    require => Class['apache::mod::php'],
    notify  => Service['httpd'],
  }

  contain mysql::server

  class { 'icingaweb2':
    manage_repo         => false,
    initialize          => true,
    install_method      => 'package',
    manage_apache_vhost => true,
    ido_db              => 'mysql',
    ido_db_name         => 'icinga',
    ido_db_user         => 'icinga',
    ido_db_pass         => 'icinga',
    web_db              => 'mysql',
    web_db_name         => 'icingaweb2',
    web_db_user         => 'icingaweb2',
    web_db_pass         => 'icinga2',
    web_db_port         => '3306',
    require             => [ Class['profile::baseline::epel'], Mysql::Db['icingaweb2'], Class['icinga2::repo']],
  }
  File['/etc/httpd/conf/httpd.conf'] -> Exec['syntax verification for icingaweb2']
  Yumrepo['icinga-stable-release'] -> Package['icingaweb2']
  contain ::icingaweb2::mod::monitoring

  package { ['php-pdo', 'php-pdo_mysql', 'php-pecl-imagick']:
    ensure  => present,
    notify  => [ Service['httpd'], Class['icingaweb2'] ],
    require => Class['profile::baseline::epel'],
  }

  package { 'nagios-plugins-all':
    ensure  => present,
    notify  => Service['icinga2'],
    require => Class['profile::baseline::epel'],
  }

  firewall { '80 allow apache access':
    dport  => [80],
    proto  => tcp,
    action => accept,
  }

  firewall { '5667 allow monitoring access':
    dport  => [5567],
    proto  => tcp,
    action => accept,
  }

  package { 'nsca':
    ensure  => present,
    require => Class['profile::baseline::epel'],
  }->

  service { 'nsca':
      ensure => running,
  }

  file { '/etc/nsca.cfg':
    ensure => present,
    source => 'puppet:///modules/profile/nsca.cfg',
    notify => Service['nsca'],
  }
  file { '/etc/icinga2/conf.d/hosts':
    ensure => directory,
  }

    file { '/root/.my.cnf':
      ensure => link,
      target => '/etc/my.cnf',
      before => Exec['create db scheme'],
    }

    File <<| tag == 'icinga2' |>>
}
