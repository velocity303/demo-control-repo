class profile::baseline::winpackages {
  package { '7zip':
    ensure => present,
  }
  package { 'jre8':
    ensure => present,
  }
}
