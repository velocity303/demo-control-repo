class profile::icinga_win_node {
  #class { 'nsclient':
  #  allowed_hosts           => ['10.20.1.0/24'],
  #  package_source_location => 'https://github.com/mickem/nscp/releases/download/0.4.1.90',
  #  config_template         => 'profile/nsclient.ini.erb',
  #}
  #  @@file { "/etc/icinga2/conf.d/hosts/${fqdn}.conf":
  #  ensure  => present,
  #  content => template('profile/icinga2_node.conf.erb'),
  #  notify  => Service['icinga2'],
  #  tag     => 'icinga2',
  #}
}
