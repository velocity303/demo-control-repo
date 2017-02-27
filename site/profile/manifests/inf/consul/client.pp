class profile::inf::consul::client {
  class { '::consul':
    config_hash    => {
      'data_dir'   => '/opt/consul',
      'datacenter' => $::location,
      'log_level'  => 'INFO',
      'node_name'  => $::name,
      'retry_join' => [hiera('consul_node_ip')],
    }
  }
}
