class profile::puppet::app_orch_settings (
  $setting = false,
){
  if $::kernel == 'windows' {
    $config_file = 'C:\ProgramData\PuppetLabs\puppet\etc\puppet.conf'
  }
  else {
    $config_file = '/etc/puppetlabs/puppet/puppet.conf'
  }
  ini_setting { 'use_cached_catalog':
    ensure  => present,
    path    => $config_file,
    section => 'agent',
    setting => 'use_cached_catalog',
    value   => $setting,
  }

}
