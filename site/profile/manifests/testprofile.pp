class profile::testprofile {
  include hiera_mssql
  $data = lookup('key1')
  notify { 'testmessage':
    message => $data,
  }
}
