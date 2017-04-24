class profile::baseline::remote_access {
  if $::kernel == 'Linux' {
    include profile::baseline::remote_access::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::remote_access::windows
  }
}
