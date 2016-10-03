class profile::inf::consul::server (
  $master_host    = true,
  $consul_head_ip = $::hostname,
) {
  if $master_host {
    class { '::consul':
      config_hash => {
        'bootstrap_expect' => 3,
        'data_dir'         => '/opt/consul',
        'datacenter'       => 'vagrant',
        'log_level'        => 'INFO',
        'node_name'        => $::hostname,
        'server'           => true,
        'bind_addr'        => $::networking[interfaces][eth1][ip],
        'client_addr'      => '0.0.0.0',
        'ui_dir'           => '/opt/consul/ui',
      },
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
        'bind_addr'        => $::networking[interfaces][eth1][ip],
        'start_join'       => [$consul_head_ip],
      },
    }
  }
}
