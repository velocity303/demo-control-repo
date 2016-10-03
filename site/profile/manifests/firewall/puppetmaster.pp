class profile::firewall::puppetmaster {
  firewall { '100 allow Puppet master access':
    dport  => '8140',
    proto  => tcp,
    action => accept,
  }

  firewall { '100 allow ActiveMQ MCollective access':
    dport  => '61613',
    proto  => tcp,
    action => accept,
  }
  firewall { '100 allow PE Specific access':
    dport  => ['443','8142'],
    proto  => tcp,
    action => accept,
  }
}

