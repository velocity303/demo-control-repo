class role::desktop {
  include profile::baseline
  include profile::desktop
  include profile::firewall::desktop
}
