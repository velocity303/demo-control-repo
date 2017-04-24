class profile::baseline::banner::linux (
  $message,
) {
  class { '::motd':
    content => $message,
  }
}
