class profile::inf::jenkins::slave {
  include git
  include profile::inf::jenkins::rpmbuild
  include profile::inf::jenkins::puppet
  class { 'jenkins::slave':
    masterurl => 'http://jenkins01.infrastructure.lab:8080',
    version   => '2.2',
    ui_user   => 'james',
    ui_pass   => 'puppetlabs',
  }

  firewall { '001 allow jenkins-swarm through the firewall':
    pkttype => 'broadcast',
    proto   => udp,
    action  => accept,
  }

  firewall { '100 allow jenkins-swarm through the firewall':
    dport  => '33848',
    proto  => udp,
    action => accept,
  }

}
