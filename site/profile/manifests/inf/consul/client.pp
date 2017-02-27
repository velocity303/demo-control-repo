class profile::inf::consul::client {
  if trusted['extensions']['pp_role'] != 'consul' {
    ensure_packages('unzip')
    class { '::consul':
      config_hash    => {
        'data_dir'   => '/opt/consul',
        'datacenter' => $::location,
        'log_level'  => 'INFO',
        'node_name'  => $::name,
        'retry_join' => [hiera('consul_node_ip')],
      }
      require        => Package['unzip'],
    }
  }
}
