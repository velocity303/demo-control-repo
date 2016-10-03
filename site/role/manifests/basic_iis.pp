class role::basic_iis {
  include profile::app::basic_iis
  include profile::firewall::web
}
