class profile::baseline::security::linux::sudo {
  include sudo
  group {'wheel':
    ensure => present,
  }
  sudo::conf { 'wheel':
    content => '%wheel ALL=(ALL) ALL',
  }
  if $::virtual == 'virtualbox' {
    sudo::conf { 'vagrant':
      content => 'vagrant ALL=(ALL) NOPASSWD:ALL',
    }
  }
}
