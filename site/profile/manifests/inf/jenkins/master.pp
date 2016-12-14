class profile::inf::jenkins::master {
  class { 'jenkins':
    version            => 'latest',
    lts                => false,
    configure_firewall => true,
  }

  firewall { '100 allow jenkins-swarm through the firewall':
    pkttype => 'broadcast',
    proto   => udp,
    action  => accept,
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
  jenkins::plugin { 'workflow-scm-step': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'durable-task': }
  jenkins::plugin { 'workflow-basic-steps': }
  jenkins::plugin { 'workflow-support': }
  jenkins::plugin { 'scm-api': }
  jenkins::plugin { 'ace-editor': }
  jenkins::plugin { 'jquery-detached': }
  jenkins::plugin { 'mailer': }
  jenkins::plugin { 'matrix-project': }
  jenkins::plugin { 'display-url-api': }
  jenkins::plugin { 'junit': }
  jenkins::plugin { 'workflow-aggregator': }
  jenkins::plugin { 'pipeline-input-step': }
  jenkins::plugin { 'pipeline-milestone-step': }
  jenkins::plugin { 'pipeline-build-step': }
  jenkins::plugin { 'pipeline-stage-view': }
  jenkins::plugin { 'workflow-multibranch': }
  jenkins::plugin { 'pipeline-stage-step': }
  jenkins::plugin { 'workflow-cps-global-lib': }
  jenkins::plugin { 'workflow-job': }
  jenkins::plugin { 'momentjs': }
  jenkins::plugin { 'pipeline-rest-api': }
  jenkins::plugin { 'handlebars': }
  jenkins::plugin { 'cloudbees-folder': }
  jenkins::plugin { 'git-server': }
  jenkins::plugin { 'branch-api': }
  jenkins::plugin { 'pipeline-graph-analysis': }
}
