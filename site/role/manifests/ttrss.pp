class role::ttrss {
  include profile::baseline
  include profile::webapp::ttrss
  include profile::firewall::webtraffic
}
