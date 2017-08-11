class profile::baseline::packages::linux {
  # Manage EPEL if an EL family OS
  if $::os['family'] == 'RedHat'{
    if $::os['release']['major'] == '7' {
      package { 'epel-release':
        ensure => present,
      }
    }
    else {
      include epel
    }
  }
  else {
    echo {'Not a RedHat OS':
      message => 'EPEL not supported on this OS'
    }
  }

  #  ensure_packages(hiera_array('base_packages'), {'ensure' => 'present'})
}
