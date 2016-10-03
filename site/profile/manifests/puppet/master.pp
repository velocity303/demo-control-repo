class profile::puppet::master {
  include profile::puppet::hiera
  include profile::puppet::agent
  include profile::puppet::consoleusers
}
