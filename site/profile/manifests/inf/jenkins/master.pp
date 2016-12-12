class profile::inf::jenkins::master {
  class { 'jenkins':
    version            => 'latest',
    lts                => false,
    configure_firewall => true,
  }
  class { 'jenkins::master':
    version => '2.2',
  }
}
