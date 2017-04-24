class profile::baseline::banner {
  if $::kernel == 'Linux' {
    include profile::baseline::banner::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::banner::windows
  }
}
