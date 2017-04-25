class profile::baseline::firewall::windows {

  Firewall_rule {
    require => Class['profile::baseline::firewall::windows::pre'],
  }

  include 'profile::baseline::firewall::windows::pre'

  resources { 'firewall_rule':
    purge => true,
  }

}
