class profile::puppet::master {
  include profile::puppet::hiera
  include profile::puppet::agent
  include profile::puppet::consoleusers
  include profile::puppet::autosign
  $mysecret = hiera('foo', 'not enabled')
  notify { 'print out secret':
    message => "my secret is ${mysecret}",
  }
}
