class profile::middleware::websphere::setup {

  file { '/opt/ibm_files':
    ensure => directory,
  }->

  staging::deploy { 'websphere_bundle.tar.gz':
    source => 'http://fileserver.infrastructure.lab/websphere_bundle.tar.gz',
    target => '/opt/ibm_files',
  }

}
