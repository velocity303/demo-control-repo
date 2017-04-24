# This is a role for the management of the puppet master
class role::puppetmaster {
  include profile::baseline
  include profile::puppet::master
  #  include profile::inf::vault
}
