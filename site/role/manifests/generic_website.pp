class role::generic_website {
  include profile::app::generic_website
  include profile::baseline
  include profile::firewall::web
}
