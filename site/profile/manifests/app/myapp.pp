class profile::app::myapp (
  $fileserver_host   = 'fileserver',
  $fileserver_domain = "${::location}.lab",
) {
  yumrepo { "MyRepo":
    baseurl      => "http://${fileserver_host}.${fileserver_domain}/myrepo/",
    descr        => "My application repository",
    enabled      => 1,
    http_caching => 'none',
    priority     => 99,
    gpgcheck     => 0
  }
  if !defined(Package['unzip']) {
    package {'unzip': ensure => present, }
  }

  $doc_root = '/opt/myapp/'
  class { 'apache':
    default_vhost => false,
  }

  file { $doc_root:
    ensure => directory,
    owner  => 'apache',
    group  => 'apache',
    mode   => '0755',
  }

  apache::vhost { $::fqdn:
    port    => '80',
    docroot => $doc_root,
    require => File[$doc_root],
  }

  file { ['/etc/facter', '/etc/facter/facts.d']:
    ensure => directory,
  }

  $myapp_version = hiera('myapp-build-version')

  file { '/etc/facter/facts.d/myapp_version.txt':
    ensure  => present,
    content => "myapp_version=${myapp_version}",
    notify  => Exec['refresh yum cache'],
  }

  exec { 'refresh yum cache':
    command     => '/bin/yum makecache fast',
    before      => Package['myapp'],
    refreshonly => true,
  }
  package { 'myapp':
    ensure => hiera('myapp-build-version'),
  }

}
