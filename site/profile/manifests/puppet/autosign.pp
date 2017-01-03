class profile::puppet::autosign {
  remote_file { '/usr/local/bin/autosign_psk':
    ensure => present,
    mode   => '0755',
    source => 'https://raw.githubusercontent.com/velocity303/personal-puppet-control/production/scripts/autosign_psk.sh?token=AEBlsLqCL6XcCDG03lH2VZL_G3CbZ3M2ks5X1nkQwA%3D%3D',
  }
  ini_setting { 'autosign':
    ensure  => present,
    path    => $settings::config,
    section => 'master',
    setting => 'autosign',
    value   => true,
  }
}
