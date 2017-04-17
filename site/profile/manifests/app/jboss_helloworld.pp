class profile::app::jboss_helloworld (
  $source = 'https://s3-us-west-2.amazonaws.com/tseteam/files/jboss-helloworld.war'
) {

  class { 'java':
    distribution => 'jdk',
  }

  wildfly::deployment { 'jboss-helloworld.war':
    source    => $source,
  }

  firewall { '100 allow jboss access':
    dport  => [8080],
    proto  => tcp,
    action => accept,
  }
}
