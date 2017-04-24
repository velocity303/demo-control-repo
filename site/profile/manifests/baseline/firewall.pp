class profile::baseline::firewall {
  if $::kernel == 'Linux' {
    include profile::baseline::firewall::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::firewall::windows
  }
}
