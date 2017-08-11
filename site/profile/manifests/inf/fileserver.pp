class profile::inf::fileserver {
  include 'stdlib'
  include 'apache'
  include profile::baseline::security::linux::selinux
  include profile::inf::nfsserver
  ensure_resource('file', '/opt/fileserver', { 'ensure' => 'directory', 'owner' => 'apache', 'group' => 'apache'})

  apache::vhost { 'fileserver':
    vhost_name    => '*',
    port          => '80',
    docroot       => '/opt/fileserver',
    priority      => '10',
    docroot_owner => 'apache',
    docroot_group => 'apache',
  }

  file { '/var/cache/yumrepos':
    ensure => directory,
  }
  if $::location == 'infrastructure' {
    createrepo { 'myrepo':
      repository_dir => '/opt/fileserver/myrepo',
      require        => File['/opt/fileserver'],
    }
    class { '::nfs':
      server_enabled => true
    }
    nfs::server::export{ '/opt/fileserver/myrepo':
      ensure  => 'mounted',
      clients => '*(rw,insecure,async,no_root_squash) localhost(rw)'
    }
  }
  else {
    class { '::nfs':
      client_enabled => true,
    }
    Nfs::Client::Mount <<| |>>
  }
  firewall { '110 apache allow all':
    dport  => '80',
    chain  => 'INPUT',
    proto  => 'tcp',
    action => 'accept',
  }

}
