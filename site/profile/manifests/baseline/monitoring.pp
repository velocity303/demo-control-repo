class profile::baseline::monitoring {
  if $::kernel == 'Linux' {
    include profile::baseline::monitoring::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::monitoring::windows
  }
}
