# A profile to open up web traffic for both windows and linux
class profile::firewall::web {
  if $::kernel == 'Linux' {
    firewall { '100 allow https':
      proto  => 'tcp',
      dport  => '443',
      action => 'accept',
    }
    firewall { '100 allow http':
      proto  => 'tcp',
      dport  => '80',
      action => 'accept',
    }
  }
  elsif $::kernel == 'Windows' {
    windows_firewall::exception { 'HTTP':
      ensure       => present,
      direction    => 'in',
      action       => 'Allow',
      enabled      => 'yes',
      protocol     => 'TCP',
      local_port   => '80',
      display_name => 'HTTP Inbound',
      description  => 'Inbound rule for HTTP Server - Port 80',
    }
    windows_firewall::exception { 'HTTPS':
      ensure       => present,
      direction    => 'in',
      action       => 'Allow',
      enabled      => 'yes',
      protocol     => 'TCP',
      local_port   => '443',
      display_name => 'HTTP Inbound',
      description  => 'Inbound rule for HTTPS Server - Port 443',
    }
  }
}
