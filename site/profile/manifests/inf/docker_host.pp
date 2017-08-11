class profile::inf::docker_host {
  include docker
  docker::run { 'jenkins':
    image  => 'jenkins',
    ports  => ['8080', '50000'],
    expose => ['8080', '50000'],
  }
}
