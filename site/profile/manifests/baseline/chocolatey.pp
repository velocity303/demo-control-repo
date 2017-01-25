class profile::baseline::chocolatey {
  include chocolatey
  chocolateysource { 'chocolatey':
    ensure => disabled,
  }
  chocolateysource { 'my_packages':
    ensure   => present,
    location => 'https://www.myget.org/F/puppet_demo/api/v2',
    priority => 1,
  }
}
