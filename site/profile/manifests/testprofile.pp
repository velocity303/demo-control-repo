class profile::testprofile {
  include hiera_sqlserver
  $data = lookup('key1')
  notify { 'testmessage':
    message => $data,
  }
}
