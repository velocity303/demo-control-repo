define profile::cloud::azure::linux (
  $server_name = $name,
  $port        = '80',
  $master_ip   = '13.65.103.22',
  $master_host = 'puppet9367.cloudapp.net',
){
  azure_vm_classic { $server_name:
    ensure          => 'running',
    endpoints       => [{
      name        => 'ssh',
      local_port  => 22,
      public_port => 22,
      protocol    => 'TCP',
    }, {
      name        => 'app',
      local_port  => $port,
      public_port => $port,
      protocol    => 'TCP',
    }],
    image           => 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-16_04-LTS-amd64-server-20160627-en-us-30GB',
    user            => 'azure',
    password        => 'Puppetl@bs!',
    location        => 'South Central US',
    size            => 'Basic_A3',
    subnet          => 'default',
    virtual_network => 'Group demo demo',
    custom_data     => template('data/bootstrap_agent.sh.erb'),
  }
}
