class role::wallabag {
  include profile::baseline
  include profile::webapp::wallabag
  include profile::firewall::webtraffic
}
