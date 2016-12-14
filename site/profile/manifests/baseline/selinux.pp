class profile::baseline::selinux {
  include selinux
  reboot { 'after selinux is applied':
    subscribe => Class['selinux'],
  }
}
