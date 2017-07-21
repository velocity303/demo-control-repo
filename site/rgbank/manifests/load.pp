define rgbank::load ( 
  $balancermembers, 
  $port = 80,
  $server_name,
  $ipaddress_web,
  $server_port,
) {

  haproxy::listen {"rgbank-${name}":
    collect_exported => false,
    ipaddress        => '0.0.0.0',
    mode             => 'http',
    options          => {
      'option'       => ['forwardfor', 'http-server-close', 'httplog'],
      'balance'      => 'roundrobin',
    },
    ports            => '80',
  }

    haproxy::balancermember { $member['host']:
      listening_service => "rgbank-${name}",
      server_names      => $server_name,
      ipaddresses       => $ipaddress_web,
      ports             => $server_port, 
      options           => 'check verify none',
    }
  firewall { "000 accept rgbank load connections on ${port}":
    dport  => $port,
    proto  => tcp,
    action => accept,
  }

}

Rgbank::Load produces Http {
  name => $name,
  ip   => $::ipaddress,
  host => $::fqdn,
  port => $port,
}
Rgbank::Load consumes Http {
  name          => $name,
  ipaddress_web => $ip,
  server_name   => $host,
  server_port   => $port,
}
