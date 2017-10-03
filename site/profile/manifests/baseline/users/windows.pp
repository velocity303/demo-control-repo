class profile::baseline::users::windows{
  user { 'Administrator':
    ensure   => present,
    password => lookup('local_admin_pass'),
  }
  reboot { 'changing administrator':
    subscribe => User['Administrator'],
  }
}
