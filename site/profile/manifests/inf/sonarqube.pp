class profile::sonarqube (
  $puppet_plugin_url = 'https://github.com/iwarapter/sonar-puppet/releases/download/1.4/sonar-puppet-plugin-1.4.jar',
  $puppet_toolkit_url = 'https://github.com/iwarapter/sonar-puppet/releases/download/1.3/sslr-puppet-toolkit-1.3.jar',
  $plugins_dir = '/var/local/sonar/extensions/plugins',
) {
  include java
  include maven::maven
  include sonarqube
  Class['maven::maven'] -> Class['sonarqube']
  remote_file { "${plugins_dir}/sonar-puppet-plugin-1.4.jar":
    ensure => present,
    source => $puppet_plugin_url,
    notify => Service['sonarqube'],
  }
  file { "${plugins_dir}/sonar-puppet-plugin-1.4.jar":
    owner  => 'sonar',
    group  => 'sonar',
    mode   => '0644',
    notify => Service['sonarqube'],
  }
  remote_file { "${plugins_dir}/sslr-puppet-toolkit-1.3.jar":
    ensure => present,
    source => $puppet_toolkit_url,
    notify => Service['sonarqube'],
  }
  file { "${plugins_dir}/sslr-puppet-toolkit-1.3.jar":
    owner  => 'sonar',
    group  => 'sonar',
    mode   => '0644',
    notify => Service['sonarqube'],
  }
  firewall { '100 allow connections to sonarqube':
    proto  => 'tcp',
    dport  => '9000',
    action => 'accept',
  }

}
