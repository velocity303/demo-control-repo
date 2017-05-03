class profile::inf::consul::client {
  if $::trusted['extensions']['pp_role'] != 'consul' {
    ensure_packages('unzip')
    class { '::consul':
      config_hash => {
        'data_dir'   => '/opt/consul',
        'datacenter' => 'vagrant',
        'log_level'  => 'INFO',
        'node_name'  => $::fqdn,
        'retry_join' => [hiera('consul_node_ip')],
      },
      require     => Package['unzip'],
    }
  }
}
