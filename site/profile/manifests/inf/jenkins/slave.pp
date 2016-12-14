class profile::inf::jenkins::slave {
  class { 'jenkins::slave':
    version   => '2.2',
  }

  firewall { '001 allow jenkins-swarm through the firewall':
    pkttype => 'broadcast',
    proto   => udp,
    action  => accept,
  }

}
