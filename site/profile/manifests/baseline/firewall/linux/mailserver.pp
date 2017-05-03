class profile::baseline::firewall::linux::mailserver {
  firewall { '100 allow dovecot and postfix access':
    dport  => [143,25,587],
    proto  => tcp,
    action => accept,
  }
}
