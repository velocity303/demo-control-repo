class profile::firewall::jenkins {
  firewall { '100 allow jenkins through the firewall':
    dport  => ['8080'],
    proto  => tcp,
    action => accept,
  }
}
