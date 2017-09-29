class profile::app::f5_simpleweb {
  profile::app::lb_app { 'simpleweb':
    app_port => '8080',
  }
}
