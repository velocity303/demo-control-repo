class role::wordpress {
  include profile::webapp::wordpress
  include profile::firewall::webtraffic
}
