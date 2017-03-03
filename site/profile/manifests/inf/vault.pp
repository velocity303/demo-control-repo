class profile::inf::vault {
  class { '::vault':
      backend              => {
        'consul'           => {
          'scheme'         => 'http',
        }
      },
      listener      => {
        'tcp' => {
          'address'     => "0.0.0.0:8200",
          'tls_disable' => '1',
        }
      },
      disable_mlock => true,
      download_url  => 'https://releases.hashicorp.com/vault/0.6.5/vault_0.6.5_linux_amd64.zip'
  }

  firewall { '100 allow various vault ports':
    dport  => 8200,
    proto  => tcp,
    action => accept,
  }

}
