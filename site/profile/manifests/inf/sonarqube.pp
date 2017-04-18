class profile::inf::sonarqube (
  $puppet_plugin_url = 'https://github.com/iwarapter/sonar-puppet/releases/download/1.4/sonar-puppet-plugin-1.4.jar',
  $puppet_toolkit_url = 'https://github.com/iwarapter/sonar-puppet/releases/download/1.3/sslr-puppet-toolkit-1.3.jar',
  $plugins_dir = '/var/local/sonar/extensions/plugins',
) {
  java::oracle { 'jdk8' :
      ensure      => 'present',
        version   => '8',
          java_se => 'jdk',
  }
  include maven::maven
  class { 'sonarqube':
    version => '5.6.6',
  }
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
  firewall { '100 allow connections to sonarqube':
    proto  => 'tcp',
    dport  => '9000',
    action => 'accept',
  }

  file_line { 'embedded port':
    path      => '/usr/local/sonarqube-5.6.6/conf/sonar.properties',
    line      => 'sonar.embeddedDatabase.port:               9092',
    subscribe => File['/usr/local/sonar/conf/sonar.properties'],
  }

}
