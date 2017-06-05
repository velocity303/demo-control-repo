class profile::middleware::websphere::dmgr(
  $profile_name  = 'PROFILE_DMGR_01',
  $cell_name     = 'CELL_01',
  $cluster_name  = 'MyCluster01',
  $instance_name = 'WebSphere85',
  $repository    = '/opt/ibm_files/was.repo.8550.basetrial/repository.config',
  $package       = 'com.ibm.websphere.BASETRIAL.v85',
  $version       = '8.5.5000.20130514_1044',
  $target        = '/opt/IBM/WebSphere/AppServer',
  $profile_base  = '/opt/IBM/WebSphere/AppServer/profiles',
  $user          = 'webadmin',
  $wsadmin_user  = 'webadmin',
  $wsadmin_pass  = 'puppetlabs',
){
  contain 'profile::middleware::websphere::ibm_im'

  websphere_application_server::instance { $instance_name:
    target       => $target,
    package      => $package,
    version      => $version,
    profile_base => $profile_base,
    repository   => $repository,
  } ->

  websphere_application_server::profile::dmgr { $profile_name:
    instance_base    => $target,
    profile_base     => $profile_base,
    cell             => $cell_name,
    node_name        => $::fqdn,
    user             => $user,
    wsadmin_user     => $wsadmin_user,
    wsadmin_pass     => $wsadmin_pass,
    collect_jvm_logs => false,
  }

}
