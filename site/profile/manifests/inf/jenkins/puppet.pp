class profile::inf::jenkins::puppet {
  ensure_packages(['puppet-lint'], {'ensure' => 'present', 'provider' =>  'puppet_gem'})
}
