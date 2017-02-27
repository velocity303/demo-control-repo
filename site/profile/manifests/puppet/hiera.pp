class profile::puppet::hiera {
  #Check if puppetserver service is defined, if so manage restart after updating hiera
  if defined(Service['pe-puppetserver']) {
    class {'::hiera':
      #backends        => ['yaml','eyaml'],
      #backend_options => {
      #  'http' => {
      #    'host'          => 'jenkins01.infrastructure.lab',
      #    'port'          => 8080,
      #    'output'        => 'json',
      #    'cache_timeout' => 10,
      #    'failure'       => 'graceful',
      #    'paths'         => ['/hiera/lookup?scope=%{::trusted.certname}&key=%{key}', '/hiera/lookup?scope=%{::virtual}&key=%{key}','/hiera/lookup?scope=%{::environment}&key=%{key}'],
      #  }
      },
      hierarchy       => [
        'secure',
        'nodes/%{hostname}',
        'location/%{location}',
        'common',
      ],
      eyaml           => true,
      logger          => 'console',
      confdir         => '/etc/puppetlabs/puppet',
      merge_behavior  => 'deeper',
      datadir         => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
      eyaml_datadir   => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
      provider        => puppetserver_gem,
      notify          => Service['pe-puppetserver'],
    }
  }
  else {
    class {'::hiera':
      #backends        => ['yaml','eyaml'],
      #backend_options => {
      #  'http' => {
      #    'host'          => 'jenkins01.infrastructure.lab',
      #    'port'          => 8080,
      #    'output'        => 'json',
      #    'cache_timeout' => 10,
      #    'failure'       => 'graceful',
      #    'paths'         => ['/hiera/lookup?scope=%{::trusted.certname}&key=%{key}', '/hiera/lookup?scope=%{::virtual}&key=%{key}','/hiera/lookup?scope=%{::environment}&key=%{key}'],
      #  }
      },
      hierarchy       => [
        'secure',
        'nodes/%{hostname}',
        'location/%{location}',
        'common',
      ],
      confdir         => '/etc/puppetlabs/puppet',
      eyaml           => true,
      logger          => 'console',
      merge_behavior  => 'deeper',
      datadir         => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
      eyaml_datadir   => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
      provider        => puppetserver_gem,
    }
  }
  package { 'hiera-http':
    ensure   => present,
    provider => puppetserver_gem,
  }
}
