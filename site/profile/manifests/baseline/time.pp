class profile::baseline::time {
  if $::kernel == 'Linux' {
    include profile::baseline::time::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::time::windows
  }
}
