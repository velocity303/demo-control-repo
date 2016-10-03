class role::passmanager {
  include profile::baseline
  include profile::webapp::webpasswordsafe
  include profile::firewall::webtraffic
}
