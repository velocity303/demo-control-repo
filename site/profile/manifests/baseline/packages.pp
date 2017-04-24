class profile::baseline::packages {
  if $::kernel == 'Linux' {
    include profile::baseline::packages::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::packages::windows
  }
}
