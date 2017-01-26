class profile::baseline::winpackages {
  package { '7zip':
    ensure => present,
  }
  package { 'jre8':
    ensure => present,
  }
  package {'notepadplusplus':
    ensure => present,
  }
  package { 'unzip':
    ensure => present,
  }

}
