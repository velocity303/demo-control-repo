class profile::inf::archiva {
  include archiva
  firewall { '100 allow archiva through the firewall':
    dport  => ['8080'],
    proto  => tcp,
    action => accept,
  }
}
