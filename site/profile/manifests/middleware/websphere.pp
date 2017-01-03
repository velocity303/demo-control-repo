class profile::websphere (
  $app_name = 'sample-1.2',
  $port     = '9080',
){
  file { ['/opt/wlp', '/opt/wlp/app', '/opt/wlp/installables']:
    ensure => directory,
  }->
  remote_file { '/opt/wlp/installables/wlp-developers-extended-8.5.5.6.jar':
    ensure => present,
    source => 'https://s3-us-west-2.amazonaws.com/tseteam/files/wlp/wlp-developers-extended-8.5.5.6.jar',
  }->
  remote_file { '/opt/wlp/installables/wlp-developers-extras-8.5.5.6.jar':
    ensure => present,
    source => 'https://s3-us-west-2.amazonaws.com/tseteam/files/wlp/wlp-developers-extras-8.5.5.6.jar'
  }->
  remote_file { '/opt/wlp/installables/wlp-developers-runtime-8.5.5.6.jar':
    ensure => present,
    source => 'https://s3-us-west-2.amazonaws.com/tseteam/files/wlp/wlp-developers-runtime-8.5.5.6.jar'
  }->
  remote_file { "/opt/wlp/app/${app_name}.war":
    ensure => present,
    source => "https://s3-us-west-2.amazonaws.com/tseteam/files/${app_name}.war",
  }->
  file { "/opt/wlp/app/${app_name}.xml":
    ensure  => present,
    content => template('profile/websphere_app.erb'),
  }
  class { 'java':
    distribution => 'jre',
  }->
  class { 'wlp':
    appNames                   => [ "${app_name}.war",],
    applicationSourceDirectory => '/opt/wlp/app',
    puppetFileRoot             => '/opt/wlp',
    serverBinaryName           => 'wlp-developers-runtime-8.5.5.6.jar',
    standalone                 => false,
    java_home                  => $::java_default_home,
    acceptLicense              => true
  }
  class { 'wlp::install': } ->
  class { 'wlp::create_server': } ->
  class { 'wlp::install_application': } ->
  class { 'wlp::start_server': }
}
