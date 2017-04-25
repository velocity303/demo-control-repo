class profile::baseline::packages::windows {
  Package { provider => chocolatey, }
  include chocolatey
  package { '7zip':
    ensure => present,
  }
  package {'notepadplusplus':
    ensure => present,
  }
  package { 'unzip':
    ensure => present,
  }

}
