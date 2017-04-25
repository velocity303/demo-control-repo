class profile::baseline::firewall::windows {

  include windows_firewall

  Firewall_rule {
    before  => Class['profile::baseline::firewall::windows::post'],
    require => Class['profile::baseline::firewall::windows::pre'],
  }

  include 'profile::baseline::firewall::windows::pre'
  include 'profile::baseline::firewall::windows::post'

  resources { 'firewall_rule':
    purge => true,
  }

}
