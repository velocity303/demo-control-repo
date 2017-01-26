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

  nodejs::npm { 'install colors':
    ensure  => 'present',
    package => 'colors',
    options => ['-g'],
  }
}
