class profile::baseline::packages {
  ensure_packages(hiera_array('base_packages'), {'ensure' => 'present'})
}
