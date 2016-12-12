class profile::inf::jenkins::slave {
  class { 'jenkins::slave':
    masterurl => 'http://jenkins01.infrastructure.lab:8080',
  }
}
