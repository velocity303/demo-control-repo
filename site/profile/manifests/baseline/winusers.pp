class profile::baseline::winusers {
  user { 'Administrator':
    ensure   => present,
    password => 'Password1',
  }
}
