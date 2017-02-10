class profile::baseline::winusers {
  user { 'Administrator':
    ensure   => present,
    password => hiera('win_admin_pass'),
  }
  reboot { 'changing administrator':
    subscribe => User['Administrator'],
  }
}
