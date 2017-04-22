class profile::baseline::epel {
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
}
