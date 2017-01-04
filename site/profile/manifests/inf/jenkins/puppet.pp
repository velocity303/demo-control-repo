class profile::inf::jenkins::puppet {
  package { 'puppet-lint':
    ensure   => present,
    provider => 'puppet_gem',
  }
}
