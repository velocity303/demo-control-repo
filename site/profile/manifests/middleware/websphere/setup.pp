class profile::middleware::websphere::setup {
  include profile::middleware::websphere::ibm_im
  
  file { '/opt/ibm_files':
    ensure => directory,
  }->

  staging::deploy { 'websphere_bundle.tar.gz':
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

  websphere_application_server::instance { 'WebSphere85':
    target       => '/opt/IBM/WebSphere/AppServer',
    package      => 'com.ibm.websphere.NDTRIAL.v85',
    version      => '8.5.5000.20130514_1044',
    profile_base => '/opt/IBM/WebSphere/AppServer/profiles',
    repository   => '/opt/ibm_files/was.repo.8550.basetrial/repository.config',
  }

}
