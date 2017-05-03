# A profile to open up web traffic for both windows and linux
class profile::baseline::firewall::linux::web {
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
