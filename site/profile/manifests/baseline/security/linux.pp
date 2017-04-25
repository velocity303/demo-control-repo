class profile::baseline::security::linux {
  include profile::baseline::security::linux::selinux
  include profile::baseline::security::linux::sudo
  include profile::baseline::security::linux::rhel_svc_denied
  include profile::baseline::security::linux::rhel_pkg_denied
  include profile::baseline::security::linux::rhel_network
}
