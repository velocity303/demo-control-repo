class profile::puppet::master {
  include profile::puppet::hiera
  include profile::puppet::agent
  include profile::puppet::consoleusers
  include profile::puppet::autosign
  include profile::puppet::sonarrunner
  codeanalysis { '/etc/puppetlabs/code/environments/production/site/':
    projectkey      => 'roles_profiles',
    projectname     => 'My Roles and Profiles',
    project_version => '1.0',
  }
}
