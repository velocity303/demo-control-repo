class profile::inf::icinga_server {
  include epel
  include apache
  include apache::mod::php
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
    require  => Class['icingaweb2'],
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

  include mysql::server

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
    require             => Class['epel'],
  }

  include ::icingaweb2::mod::monitoring


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
    ensure => present,
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
    File <<| tag == 'icinga2' |>>
}
