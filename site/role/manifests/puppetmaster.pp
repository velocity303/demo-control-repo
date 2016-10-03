class role::puppetmaster {
  include profile::baseline
  include profile::firewall::puppetmaster
  if $::pe_server_version {
    include profile::puppet::pe::master
  }
  else {
    include profile::puppet::poss::master
  }
}
