class profile::inf::artifactory {
  include artifactory
  firewall { '100 allow artifactory through the firewall':
    dport  => ['8081'],
    proto  => tcp,
    action => accept,
  }
}
