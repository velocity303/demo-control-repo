class profile::inf::jenkins::slave {
  class { 'jenkins::slave':
    version   => '2.2',
  }
}
