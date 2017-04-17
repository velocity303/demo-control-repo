class profile::middleware::jboss (
  $version = '8.0.0',
  $source = 'http://download.jboss.org/wildfly/8.0.0.Final/wildfly-8.0.0.Final.tar.gz'
) {

  class { 'java':
    version => latest,
  }

  class { '::wildfly':
    install_source => $source,
    version        => $version,
    require        => Class['java'],
    java_home      => $::java_default_home,
  }

  firewall { '100 allow connections to wildfly':
    proto   => 'tcp',
    dport   => '8080',
    action  => 'accept',
  }

}
