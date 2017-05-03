class profile::baseline::time::windows {
  #this class should define time settings for windows systems.
  class { 'winntp':
    servers => lookup('ntp::servers'),
  }
  dsc_xtimezone { 'set timezone':
    dsc_timezone => 'Central Standard Time',
    dsc_issingleinstance => 'yes',
  }
}
