class profile::baseline::firewall::windows {

  # Allow WinRM
  windows_firewall::exception { 'WINRM':
    ensure       => present,
    direction    => 'in',
    action       => 'Allow',
    enabled      => 'yes',
    protocol     => 'TCP',
    local_port   => '5985',
    remote_port  => 'any',
    display_name => 'Windows Remote Management HTTP-In',
    description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
  }

  # Allow WinRDP
  windows_firewall::exception { 'RDP':
    ensure       => present,
    direction    => 'in',
    action       => 'Allow',
    enabled      => 'yes',
    protocol     => 'TCP',
    local_port   => '3389',
    remote_port  => 'any',
    display_name => 'Remote Desktop - User Mode (TCP-In)',
    description  => 'Inbound rule for Windows Remote Desktop service to allow RDP traffic. [TCP 3389]',
  }

}
