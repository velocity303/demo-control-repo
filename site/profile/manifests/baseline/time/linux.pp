class profile::baseline::time::linux {
  include ::ntp
  file { '/etc/localtime':
    ensure => link,
    target => '/usr/share/zoneinfo/US/Central',
  }
}
