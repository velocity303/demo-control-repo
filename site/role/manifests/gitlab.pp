class role::gitlab {
  include profile::baseline
  include profile::inf::gitlab
  include profile::firewall::web
}
