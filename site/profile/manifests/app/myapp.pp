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
  
  package { 'myapp':
    ensure => hiera('myapp-build-version'),
  }

}
