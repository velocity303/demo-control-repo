class profile::inf::jenkins::master {
  class { 'jenkins':
    version            => 'latest',
    lts                => false,
    configure_firewall => true,
  }
  class { 'jenkins::master':
    version => '2.2',
  }
  jenkins::plugin { 'puppet-enterprise-pipeline': }
  jenkins::plugin { 'gitlab-plugin': }
  jenkins::plugin { 'publish-over-ssh': }
}
