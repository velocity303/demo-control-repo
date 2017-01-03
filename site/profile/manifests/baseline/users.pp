class profile::baseline::users {
  include profile::baseline::zsh
  class { 'accounts':
    ssh_keys       => hiera_hash('accounts::ssh_keys'),
    users          => hiera_hash('accounts::users'),
    usergroups     => hiera_hash('accounts::usergroups'),
    purge_ssh_keys => true,
    require        => Package['zsh'],
  }
  accounts::account { hiera('usergroup'):
    authorized_keys => [ 'jameswork' ],
  }
  user {'root':
    shell    => '/usr/bin/zsh',
    ensure   => 'present',
    comment  => 'root',
    home     => '/root',
    password => '$6$70YVLQRK$PSiwOzkKBVO/RP13MukEM13YvyQjOPo8n5LX46rXoEJ7VVwGxH8cPnjLkbTJVExUbEJMrobGunO805JrgHZMs.',
    require  => Package['zsh'],
  }
  if $::virtual == 'virtualbox' {
    user { 'vagrant':
      shell  => '/bin/bash',
      ensure => present,
      groups => ['ssh'],
    }
  }
}
