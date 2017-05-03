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

  package { 'powershell':
    ensure => latest,
    provider => 'chocolatey',
    install_options => ['-pre', '--ignore-package-exit-codes'],
    notify => Reboot['afterpowershell'],
  }

  reboot { 'afterpowershell':
    when => pending,
  }

}
