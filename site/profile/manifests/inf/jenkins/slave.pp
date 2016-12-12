class profile::inf::jenkins::slave {
  class { 'jenkins::slave':
    masterurl => 'http://jenkins02.infrastructure.lab:8080',
    version   => '2.2',
    ui_user   => 'admin',
    ui_pass   => 'puppetlabs',
  }
}
