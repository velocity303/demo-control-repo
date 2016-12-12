class profile::app::myapp (
  $fileserver_host   = 'fileserver',
  $fileserver_domain = "${::location}.lab",
) {
  yumrepo { "MyRepo":
    baseurl  => "http://${fileserver_host}.${fileserver_domain}/repository/",
    descr    => "My application repository",
    enabled  => 1,
    priority => 99,
    gpgcheck => 0
  }
}
