class profile::middleware::websphere::setup {
  include profile::middleware::websphere::ibm_im

  file { '/opt/ibm_files':
    ensure => directory,
  }

  -> staging::deploy { 'websphere_bundle.tar.gz':
    source  => 'http://fileserver.infrastructure.lab/websphere_bundle.tar.gz',
    target  => '/opt/ibm_files',
    creates => '/opt/ibm_files/agent.installer.linux.gtk.x86_64_1.6.0.20120831_1216.zip',
  }

  class { 'websphere_application_server':
    user         => 'webadmin',
    group        => 'webadmin',
    manage_user  => true,
    manage_group => true,
  }


}
