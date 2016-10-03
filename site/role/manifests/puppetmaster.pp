class role::puppetmaster {
  include profile::baseline
  include profile::firewall::puppetmaster
  include profile::puppet::master
}
