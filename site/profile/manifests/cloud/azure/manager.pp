class profile::cloud::azure::manager (
  $subscription_id = 'something',
  $cert_path = 'something',
){
  package { 'azure-cli':
    ensure   => present,
    provider => npm,
  }
  package { ['azure','azure_mgmt_compute','azure_mgmt_storage','azure_mgmt_resources', 'azure_mgmt_network', 'hocon']:
    ensure   => present,
    provider => puppet_gem,
  }
  file { '/etc/puppetlabs/puppet/azure.conf':
    ensure  => present,
    content => "azure: {
  subscription_id: \"${subscription_id}\"
  management_certificate: \"${cert_path}\"
    }"
  }
}
