class profile::puppet::app_orch_settings (
  $setting = false,
){
  ini_setting { 'use_cached_catalog':
    ensure  => present,
    path    => $settings::config,
    section => 'agent',
    setting => 'use_cached_catalog',
    value   => $setting,
  }

}
