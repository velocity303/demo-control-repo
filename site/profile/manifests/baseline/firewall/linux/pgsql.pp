class profile::baseline::firewall::pgsql {

  firewall { '100 allow external pgsql access':
    dport  => 5432,
    proto  => tcp,
    action => accept,
  }

}
