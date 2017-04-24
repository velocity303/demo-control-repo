class profile::baseline::users {
  if $::kernel == 'Linux' {
    include profile::baseline::users::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::users::windows
  }
}
