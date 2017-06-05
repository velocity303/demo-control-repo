class profile::middleware::websphere::appserver(
  $dmgr_host     = $::fqdn,
  $dmgr_profile  = 'PROFILE_DMGR_01',
  $app_profile   = 'PROFILE_APP_001',
  $cell_name     = 'CELL_01',
  $member_name   = "${::hostname}_appserver",
  $cluster_name  = 'MyCluster01',
  $instance_name = 'WebSphere85',
  $repository    = '/opt/ibm_files/was.repo.8550.ndtrial/repository.config',
  $package       = 'com.ibm.websphere.NDTRIAL.v85',
  $version       = '8.5.5000.20130514_1044',
  $target        = '/opt/IBM/WebSphere/AppServer',
  $profile_base  = '/opt/IBM/WebSphere/AppServer/profiles',
  $template_path = '/opt/IBM/WebSphere/AppServer/profileTemplates/managed',
){
  contain 'profile::middleware::websphere::ibm_im'

  websphere_application_server::instance { $instance_name:
    target       => $target,
    package      => $package,
    version      => $version,
    profile_base => $profile_base,
    repository   => $repository,
  } ->

  websphere_application_server::profile::dmgr { $dmgr_profile:
    instance_base    => $target,
    profile_base     => $profile_base,
    cell             => $cell_name,
    node_name        => 'dmgrNode01',
    user             => $user,
    wsadmin_user     => $wsadmin_user,
    wsadmin_pass     => $wsadmin_pass,
    collect_jvm_logs => false,
  } ->

  websphere_application_server::profile::appserver { $app_profile:
    instance_base => $target,
    profile_base  => $profile_base,
    cell          => $cell_name,
    template_path => $template_path,
    dmgr_host     => $dmgr_host,
    node_name     => 'app01',
  }

  @@websphere::cluster::member { $member_name:
    ensure                           => 'present',
    cluster                          => $cluster_name,
    node                             => $::fqdn,
    cell                             => $cell_name,
    dmgr_host                        => $dmgr_host,
    dmgr_profile                     => $dmgr_profile,
    profile_base                     => $profile_base,
  }
}
