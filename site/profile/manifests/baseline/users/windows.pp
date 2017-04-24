class profile::baseline::users::windows{
  user { 'Administrator':
    ensure   => present,
    password => 'Password1',
  }
  reboot { 'changing administrator':
    subscribe => User['Administrator'],
  }
}
