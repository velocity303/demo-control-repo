class profile::inf::jenkins::slave {
  class { 'jenkins::slave':
    masterurl => 'http://jenkins02.infrastructure.lab:8080',
  }
}
