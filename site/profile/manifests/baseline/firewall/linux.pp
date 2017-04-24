# All rules to define how my firewall should work on a linux system
class profile::baseline::firewall::linux {

  include firewall

  Firewall {
    before  => Class['profile::baseline::firewall::linux::post'],
    require => Class['profile::baseline::firewall::linux::pre'],
  }

  include 'profile::baseline::firewall::linux::pre'
  include 'profile::baseline::firewall::linux::post'

  resources { 'firewall':
    purge => true,
  }

}
