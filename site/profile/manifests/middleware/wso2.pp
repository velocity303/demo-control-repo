class profile::wso2 {
  include wso2
  user { 'esb1':
    ensure => present,
  }
  wso2::esb { 'esb1':
    version    => '5.0.0',
    java_home  => $::java_default_home,
    source     => '/var/tmp/wso2esb-5.0.0.zip',
    extra_jars => ['mysql-connector-java-5.1.39-bin.jar'],
  }
  include java
}
