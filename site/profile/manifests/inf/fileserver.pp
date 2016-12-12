class profile::inf::fileserver {
  include 'stdlib'
  include 'apache'

  ensure_resource('file', '/opt/fileserver', { 'ensure' => 'directory', 'owner' => 'root', 'group' => 'root' })

  apache::vhost { 'fileserver':
    vhost_name    => '*',
    port          => '80',
    docroot       => '/opt/fileserver',
    priority      => '10',
    docroot_owner => 'root',
    docroot_group => 'root',
  }

  firewall { '110 apache allow all':
    dport  => '80',
    chain  => 'INPUT',
    proto  => 'tcp',
    action => 'accept',
  }

}
