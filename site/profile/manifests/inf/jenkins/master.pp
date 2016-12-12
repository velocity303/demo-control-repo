class profile::inf::jenkins::master {
  class { 'jenkins':
    version => 'latest',
    lts     => false,
  }
  include jenkins::master
}
