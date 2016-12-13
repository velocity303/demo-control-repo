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
  jenkins::plugin { 'git': }
  jenkins::plugin { 'workflow-step-api': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'plain-credentials': }
  jenkins::plugin { 'structs': }
  jenkins::plugin { 'script-security': }
  jenkins::plugin { 'workflow-cps': }
  jenkins::plugin { 'workflow-api': }
  jenkins::plugin { 'workflow-durable-task-step': }
}
