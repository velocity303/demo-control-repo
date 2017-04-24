class profile::puppet::master {
  #  include profile::puppet::hiera
  include profile::puppet::agent
  include profile::puppet::consoleusers
  include profile::puppet::autosign
  include profile::puppet::sonarrunner
  codeanalysis { '/etc/puppetlabs/code/environments/production/site/':
    projectkey      => 'roles_profiles',
    projectname     => 'My Roles and Profiles',
    project_version => '1.0',
  }

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
    dport  => ['443','8142', '4433', '8170', '8143'],
    proto  => tcp,
    action => accept,
  }

}
