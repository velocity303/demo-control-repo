#Profile for configuring Gitlab installation
class profile::inf::gitlab {

  #Install gitlab

  class { 'gitlab':
    external_url => "http://${::fqdn}",
  }

  firewall { '100 allow https':
    proto  => 'tcp',
    dport  => '443',
    action => 'accept',
  }

  firewall { '100 allow http':
    proto  => 'tcp',
    dport  => '80',
    action => 'accept',
  }

}
