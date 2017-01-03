class profile::inf::ftp {

  # FTP Server filename
  $dirs = [
    '/opt/sni/',
    '/opt/sni/ftpcfg'
  ]

  case $::hostname {
    /(prod|prd|admin)/: { $ftp_server_name = 'ftp.example.com' }
    default:            { $ftp_server_name = 'devftp.example.com' }
  }

  file { $dirs:
    ensure => directory,
    owner  => root,
    group  => root,
  }

  file { "${dirs[1]}/ftp_server_name":
    ensure  => file,
    content => $ftp_server_name,
    owner   => root,
    group   => root,
  }

}
