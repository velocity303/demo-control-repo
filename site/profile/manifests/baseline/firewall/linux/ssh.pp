# A profile to open up port 22 for ssh traffic
class profile::firewall::ssh {
  firewall { '100 allow ssh traffic':
    proto  => 'tcp',
    dport  => '22',
    action => 'accept',
  }
}
