class profile::inf::jenkins::rpmbuild {
  package { 'rpm-build':
    ensure => present,
  }
  package { 'rpmdevtools':
    ensure => present,
  }
}
