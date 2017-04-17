class profile::app::jboss_helloworld (
  $source = 'https://s3-us-west-2.amazonaws.com/tseteam/files/jboss-helloworld.war'
) {
  include profile::middleware::jboss
  wildfly::deployment { 'jboss-helloworld.war':
    source    => $source,
  }
}
