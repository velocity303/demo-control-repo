class profile::baseline::path {
  if $::kernel == 'Linux' {
    include profile::baseline::path::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::path::windows
  }
}
