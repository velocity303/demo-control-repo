class role::owncloud {
  include profile::webapp::owncloud
  include profile::baseline
  include profile::firewall::webtraffic
}
