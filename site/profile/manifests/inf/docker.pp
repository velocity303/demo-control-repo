# A puppet profile for installation and management of docker
class profile::inf::docker {
  include ::docker
  docker::image { 'busybox':
    ensure  => present,
    require => Class['docker']
  }
}
