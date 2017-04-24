class profile::baseline::misc {
  if $::kernel == 'Linux' {
    include profile::baseline::misc::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::misc::windows
  }
}
