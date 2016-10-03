class role::gitlab {
  include profile::baseline
  include profile::webapp::gitlab
  include profile::firewall::web
}
