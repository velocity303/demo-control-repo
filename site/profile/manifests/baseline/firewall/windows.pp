class profile::baseline::firewall::windows {

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
