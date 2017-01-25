class profile::puppet::autosign {
  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => present,
    content => '*',
    notify  => Service['pe-puppetserver'],
  }
}
