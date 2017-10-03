define profile::app::lb_app (
  $app_name = $title,
  $app_port = '8080',
) {
  #transform data for F5
  $array = puppetdb_query('facts[value] { name = "hostname" and  certname in resources[certname] { tag = "simpleweb" and exported = true} }')
  $simple_array = $array.map |$k,$v| { values($v) }
  $flat_array = flatten($simple_array)
  $my_array_hash = $flat_array.map |$k| { { name => "/Common/${app_name}_${k}", port => $app_port } }

  F5_node <<| tag == $app_name |>> ->

  f5_pool { "/Common/${app_name}_pool":
    ensure                    => 'present',
    members                   => $my_array_hash,
    availability_requirement  => 'all',
    health_monitors           => ['/Common/http_head_f5'],
  }->
  f5_virtualserver { "/Common/${app_name}_vs":
    ensure                    => 'present',
    provider                  => 'standard',
    default_pool              => "/Common/${app_name}_pool",
    destination_address       => lookup('f5_external'),
    destination_mask          => '255.255.255.255',
    http_profile              => '/Common/http',
    service_port              => '80',
    protocol                  => 'tcp',
    source                    => '0.0.0.0/0',
    vlan_and_tunnel_traffic   => {'enabled' => ['/Common/Client']},
  }

  Notify { "output":
    message => "your original output is ${array}"
  }
  Notify { "output2":
    message => "your new array output is ${flat_array}"
  }
  Notify { "output3":
    message => "your new array output is ${my_array_hash}"
  }

}
