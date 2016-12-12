class role::gitlab {
  include profile::inf::gitlab
  include profile::firewall::web
}
