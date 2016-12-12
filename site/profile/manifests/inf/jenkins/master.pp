class profile::inf::jenkins::master {
  class { 'jenkins':
    version => 'latest',
    lts     => false,
  }
  class { 'jenkins::master':
    version => '2.2',
  }
}
