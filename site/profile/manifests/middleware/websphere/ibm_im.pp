class profile::middleware::websphere::ibm_im (
  $source   = '/opt/ibm_files/agent.installer.linux.gtk.x86_64_1.6.0.20120831_1216.zip',
  $target   = '/opt/IBM/InstallationManager',
  $user     = 'webadmin',
  $group    = 'webadmin',
  $base_dir = '/opt/IBM'
){

  $prereq_pkgs = ['gtk2.i686','libXtst.i686']

  package{$prereq_pkgs:
    ensure => present,
  }

  class { '::ibm_installation_manager':
    deploy_source => true,
    source        => $source,
    target        => $target,
    require      => Staging::Deploy['websphere_bundle.tar.gz']
  }

}
