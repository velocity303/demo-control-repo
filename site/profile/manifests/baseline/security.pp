class profile::baseline::security {
  if $::kernel == 'Linux' {
    include profile::baseline::security::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::security::windows
  }
}
