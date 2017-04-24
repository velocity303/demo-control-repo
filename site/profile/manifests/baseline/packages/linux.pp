class profile::baseline::packages::linux {
  ensure_packages(hiera_array('base_packages'), {'ensure' => 'present'})
}
