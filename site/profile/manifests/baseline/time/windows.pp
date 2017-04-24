class profile::baseline::time::windows {
  #this class should define time settings for windows systems.
  class { 'winntp':
    servers => lookup('ntp::servers'),
  }
}
