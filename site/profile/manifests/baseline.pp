class profile::baseline {
  if $::kernel == 'Linux' {
    include profile::baseline::motd
    contain profile::baseline::ssh
    include profile::baseline::packages
    include profile::baseline::ntp
    include profile::baseline::path
    include profile::puppet::agent
    include profile::inf::consul::client
    #include profile::baseline::selinux
    contain profile::baseline::hosts
    Class['profile::baseline::ssh'] -> Class['profile::baseline::hosts']

  }
  elsif $::kernel == 'windows' {
    include profile::baseline::winpackages
    include profile::baseline::chocolatey
    include profile::baseline::winusers
    include profile::baseline::registry
  }
}
