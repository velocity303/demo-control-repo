class profile::inf::fileserver {
  include 'stdlib'
  include 'apache'

  ensure_resource('file', '/opt/fileserver', { 'ensure' => 'directory', 'owner' => 'apache', 'group' => 'apache', 'require' =>  'Class["apache"]'})

  apache::vhost { 'fileserver':
    vhost_name    => '*',
    port          => '80',
    docroot       => '/opt/fileserver',
    priority      => '10',
    docroot_owner => 'apache',
    docroot_group => 'apache',
    require       => Class['apache'],
  }

  createrepo { 'myrepo':
    repository_dir => '/opt/fileserver/myrepo',
    require        => File['/opt/fileserver'],
  }

  firewall { '110 apache allow all':
    dport  => '80',
    chain  => 'INPUT',
    proto  => 'tcp',
    action => 'accept',
  }

}
