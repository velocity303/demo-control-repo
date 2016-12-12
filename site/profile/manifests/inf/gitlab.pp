#Profile for configuring Gitlab installation
class profile::inf::gitlab {

  #Install gitlab

  class { 'gitlab':
    external_url => "http://${::fqdn}",
  }
}
