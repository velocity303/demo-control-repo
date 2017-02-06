class profile::baseline::winusers {
  user { 'Administrator':
    ensure   => present,
    password => 'Password1',
  }
  reboot { 'changing administrator':
    subscribe => User['Administrator'],
  }
}
