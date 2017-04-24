class profile::baseline::remote_access::linux {
  contain openssh
  group { 'ssh':
    ensure => present,
  }
}
