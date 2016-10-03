class profile::cloud::azure::example {

  profile::cloud::azure::linux { 'dbserver':
    port => '3306',
  }

  profile::cloud::azure::linux { 'webserver':
    port => '80',
  }
}
