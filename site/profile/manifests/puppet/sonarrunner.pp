class profile::puppet::sonarrunner {
  $sonarqube_server = 'http://sonarqube.infrastructure.lab:9000'
  $jdbc             = {
    url            => 'jdbc:h2:tcp://sonarqube.infrastructure.lab:9092/sonar',
    username       => 'sonar',
    password       => 'sonar',
  }
  include java
  class { 'sonarqube::runner':
    sonarqube_server => $sonarqube_server,
    jdbc             => $jdbc,
  }
  file {'/etc/sonarrunner':
    ensure => directory,
  }
}
