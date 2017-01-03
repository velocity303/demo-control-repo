class profile::hashicorp::vault {
  class { '::vault':
    config_hash  => {
      'backend'       => {
        'consul' => {}
      },
      'listener'      => {
        'tcp' => {
          'address'     => "${::fqdn}:8200",
          'tls_disable' => '1',
        }
      },
      'telemetry'     => {
        'statsite_address' => "${::ipaddress_eth1}:8125",
        'disable_hostname' => true,
      },
      'disable_mlock' => true,
    },
    download_url => 'https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_linux_amd64.zip'
  }
}
