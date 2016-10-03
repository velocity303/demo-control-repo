class role::sensuserver {
  include profile::baseline
  include profile::system::sensuserver
  include profile::webapp::uchiwa
  include profile::firewall::webtraffic
}
