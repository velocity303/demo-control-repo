class profile::baseline::banner {
  $message,
  if $::kernel == 'Linux' {
    class { 'profile::baseline::banner::linux':
      message => $message,
    }
  }
  elsif $::kernel == 'windows' {
    class { 'profile::baseline::banner::windows':
      message => $message,
    }
  }
}
