class profile::inf::vault {
  class { '::vault':
      backend       => {
        'consul' => {}
      },
      listener      => {
        'tcp' => {
          'address'     => "${::fqdn}:8200",
          'tls_disable' => '1',
        }
      },
      telemetry     => {
        'statsite_address' => "${::ipaddress}:8125",
        'disable_hostname' => true,
      },
      disable_mlock => true,
      download_url  => 'https://releases.hashicorp.com/vault/0.6.5/vault_0.6.5_linux_amd64.zip'
  }
}
