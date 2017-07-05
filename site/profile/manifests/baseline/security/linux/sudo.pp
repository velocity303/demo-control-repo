class profile::baseline::security::linux::sudo (
  $tz = "-06:00",
  $window_wday  = { start => 'Wednesday', end => 'Thursday' },
  $window_time = { start  => '08:00', end => '12:00' },
  $window_type = 'window',
) {
  include sudo
  $rule_purge = change_window($tz, $window_type, $window_wday, $window_time)
  purge { 'file':
    if => [ 'name', '=~', '10_add*' ]
  }

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
  if $rule_purge == 'false' {
    sudo::conf { 'add james rule':
      content => 'james ALL=(ALL) NOPASSWD:ALL',
    }
  }
}
