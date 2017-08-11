# This is a class to help manage users on linux
class profile::baseline::users::linux {

  $local_admin_pass = hiera('local_admin_pass')
  $mysalt = hiera('my_password_salt')

  if $::virtual == 'virtualbox' {
    user { 'vagrant':
      ensure => present,
      shell  => '/bin/bash',
      groups => ['ssh'],
    }
  }

  user {'root':
    ensure   => 'present',
    shell    => '/usr/bin/zsh',
    comment  => 'root',
    home     => '/root',
    password => pw_hash($local_admin_pass, 'SHA-512', $mysalt),
    require  => Package['zsh'],
  }

  class { 'accounts':
    ssh_keys       => hiera_hash('accounts::ssh_keys'),
    users          => hiera_hash('accounts::users'),
    usergroups     => hiera_hash('accounts::usergroups'),
    purge_ssh_keys => true,
    require        => Package['zsh'],
  }
  accounts::account { hiera('usergroup'):
    authorized_keys => [ 'jameswork' ],
    require         => Package['zsh'],
  }

}
