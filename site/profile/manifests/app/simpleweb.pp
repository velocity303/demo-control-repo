class profile::app::simpleweb (
  String  $tomcat_major_version = '7',
) {
  $plsample_version = lookup('simpleweb-build')
  File{
    require => Host['puppet'],
  }

  case $tomcat_major_version {
    '6': {
      $tomcat_version = '6.0.53'
      $catalina_dir = '/opt/apache-tomcat6'
      $tomcat_other_versions = [ '7', '8']
    }
    '7': {
      $tomcat_version = '7.0.81'
      $catalina_dir = '/opt/apache-tomcat7'
      $tomcat_other_versions = [ '6', '8']
    }
    '8': {
      $tomcat_version = '8.0.43'
      $catalina_dir = '/opt/apache-tomcat8'
      $tomcat_other_versions = [ '6', '7']
    }
    default: {
      $tomcat_version = '6.0.53'
      $catalina_dir = '/opt/apache-tomcat6'
      $tomcat_other_versions = [ '7', '8']
    }
  }

  class { 'java':
    distribution => 'jre'
  }

  class { '::tomcat':
    catalina_home => $catalina_dir,
  }

  firewall { '100 allow tomcat access':
    dport  => [8080],
    proto  => tcp,
    action => accept,
  }

  tomcat::instance{ "tomcat${tomcat_major_version}":
    install_from_source    => true,
    source_url             => "http://apache.mirrors.pair.com/tomcat/tomcat-${tomcat_major_version}/v${tomcat_version}/bin/apache-tomcat-${tomcat_version}.tar.gz",
    source_strip_first_dir => true,
    catalina_base          => $catalina_dir,
    catalina_home          => $catalina_dir,
    before                 => Tomcat::War["plsample-${plsample_version}.war"],
  }

  -> tomcat::setenv::entry {'JAVA_OPTS':
    value => '-Djava.security.egd=file:/dev/./urandom',
  }

  tomcat::war { "plsample-${plsample_version}.war" :
    war_source    => "http://fileserver.infrastructure.lab/plsample-${plsample_version}.war",
    catalina_base => $catalina_dir,
    notify        => File["${catalina_dir}/webapps/plsample"],
  }

  file { "${catalina_dir}/webapps/plsample":
    ensure => 'link',
    target => "${catalina_dir}/webapps/plsample-${plsample_version}",
    notify => Tomcat::Service["plsample-tomcat${tomcat_major_version}"],
  }
  $tomcat_other_versions.each |String $version| {
    service {"tomcat-plsample-tomcat${version}":
      ensure => stopped,
      status => "ps aux | grep \'catalina.base=/opt/apache-tomcat${version}\' | grep -v grep",
      stop   => "su -s /bin/bash -c \'/opt/apache-tomcat${version}/bin/catalina.sh stop tomcat\'",
      before => File["/opt/apache-tomcat${version}"],
    }
    file {"/opt/apache-tomcat${version}":
      ensure => absent,
      force  => true,
      backup => false,
      before => Tomcat::Service["plsample-tomcat${tomcat_major_version}"],
    }
  }

  tomcat::service { "plsample-tomcat${tomcat_major_version}":
    catalina_base => $catalina_dir,
    catalina_home => $catalina_dir,
    service_name  => 'plsample',
    subscribe     => Tomcat::War["plsample-${plsample_version}.war"],
  }

  @@f5_node { "/Common/simpleweb_${::hostname}":
    ensure                   => 'present',
    address                  => $::ipaddress,
    description              => 'Simpleweb Server',
    availability_requirement => 'all',
    health_monitors          => ['/Common/icmp'],
    tag                      => 'simpleweb',
  }

  $array = puppetdb_query('facts[value] { name = "ipaddress" and  certname in resources[certname] { tag = "simpleweb" and exported = true} }')
  $simple_array = $array.map |$k,$v| { values($v) }
  $hash = hash($array)
  Notify { "output":
    message => "your original output is ${array}"
  }
  Notify { "output2":
    message => "your new array output is ${simple_array}"
  }

}
