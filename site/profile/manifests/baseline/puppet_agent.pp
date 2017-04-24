class profile::baseline::puppet_agent {
  if $::kernel == 'Linux' {
    include profile::baseline::puppet_agent::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::puppet_agent::windows
  }
}
