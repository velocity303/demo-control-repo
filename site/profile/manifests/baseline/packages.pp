class profile::baseline::packages {
  package { hiera_array('base_packages'):
    ensure => present,
  }
}
