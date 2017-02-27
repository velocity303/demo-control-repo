class profile::inf::consul::server (
  $master_host    = true,
  $consul_head_ip = $::hostname,
  $bind_addr      = $::ipaddress,
) {
  ensure_packages('unzip')
  if $master_host {
    class { '::consul':
      config_hash => {
        'bootstrap_expect' => 3,
        'data_dir'         => '/opt/consul',
        'datacenter'       => 'vagrant',
        'log_level'        => 'INFO',
        'node_name'        => $::hostname,
        'server'           => true,
        'bind_addr'        => $bind_addr,
        'client_addr'      => '0.0.0.0',
        'ui_dir'           => '/opt/consul/ui',
      },
      require     => Package['unzip'],
    }
  }
  else {
    class { '::consul':
      config_hash => {
        'bootstrap_expect' => 3,
        'data_dir'         => '/opt/consul',
        'datacenter'       => 'vagrant',
        'log_level'        => 'INFO',
        'node_name'        => $::hostname,
        'server'           => true,
        'bind_addr'        => $bind_addr,
        'start_join'       => [$consul_head_ip],
      },
      require     => Package['unzip'],
    }
  }
  firewall { '100 allow various consul tcp ports':
    dport  => [ 8300, 8301, 8302, 8400, 8500, 8600 ],
    proto  => tcp,
    action => accept,
  }
  firewall { '100 allow various consul udp ports':
    dport  => [ 8301, 8302, 8600 ],
    proto  => udp,
    action => accept,
  }
}
