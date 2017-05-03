class profile::baseline::firewall::linux::mysql {
  firewall { '100 allow external mysql access':
    dport  => 3306,
    proto  => tcp,
    action => accept,
  }

}
