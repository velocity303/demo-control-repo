class profile::inf::f5sample {
 f5_node { '/Common/WWW_Server_1':
   ensure                   => 'present',
   address                  => '172.16.226.10',
   description              => 'WWW Server 1',
   availability_requirement => 'all',
   health_monitors          => ['/Common/icmp'],
 }->
 f5_node { '/Common/WWW_Server_2':
   ensure                   => 'present',
   address                  => '172.16.226.11',
   description              => 'WWW Server 2',
   availability_requirement => 'all',
   health_monitors          => ['/Common/icmp'],
 }->
 f5_pool { '/Common/puppet_pool':
   ensure                    => 'present',
   members                   => [
     { name => '/Common/WWW_Server_1', port => '80', },
     { name => '/Common/WWW_Server_2', port => '80', },
   ],
   availability_requirement  => 'all',
   health_monitors           => ['/Common/http_head_f5'],
 }->
 f5_virtualserver { '/Common/puppet_vs':
   ensure                    => 'present',
   provider                  => 'standard',
   default_pool              => '/Common/puppet_pool',
   destination_address       => '192.168.80.100',
   destination_mask          => '255.255.255.255',
   http_profile              => '/Common/http',
   service_port              => '80',
   protocol                  => 'tcp',
   source                    => '0.0.0.0/0',
   vlan_and_tunnel_traffic   => {'enabled' => ['/Common/Client']},
 }

}
