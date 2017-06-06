class profile::middleware::websphere::dmgr(
  $profile_name  = 'PROFILE_DMGR_01',
  $cell_name     = 'CELL_01',
  $cluster_name  = 'MyCluster01',
  $instance_name = 'WebSphere85',
  $repository    = '/opt/ibm_files/was.repo.8550.ndtrial/repository.config',
  $package       = 'com.ibm.websphere.NDTRIAL.v85',
  $version       = '8.5.5000.20130514_1044',
  $target        = '/opt/IBM/WebSphere/AppServer',
  $profile_base  = '/opt/IBM/WebSphere/AppServer/profiles',
  $user          = 'webadmin',
  $wsadmin_user  = 'webadmin',
  $wsadmin_pass  = 'puppetlabs',
){
  contain 'profile::middleware::websphere::ibm_im'
  include profile::middleware::websphere::setup

  websphere_application_server::instance { $instance_name:
    target       => $target,
    package      => $package,
    version      => $version,
    profile_base => $profile_base,
    repository   => $repository,
    require      => Staging::Deploy['websphere_bundle.tar.gz']
  } ->

  websphere_application_server::profile::dmgr { $profile_name:
    instance_base    => $target,
    profile_base     => $profile_base,
    cell             => $cell_name,
    node_name        => 'dmgrNode01',
    user             => $user,
    wsadmin_user     => $wsadmin_user,
    wsadmin_pass     => $wsadmin_pass,
    collect_jvm_logs => false,
  } ->

  websphere_application_server::cluster { $cluster_name:
    profile_base => $profile_base,
    dmgr_profile => $profile_name,
    cell         => $cell_name,
  }

}
