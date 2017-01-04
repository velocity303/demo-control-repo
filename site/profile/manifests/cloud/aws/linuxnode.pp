define profile::cloud::aws::linuxnode (
  $nodename = $title,
  $availability_zone = 'us-west-2a',
  $image_id = ami-775e4f16,
  $region = 'us-west-2',
  $instance_type = 'm3.medium',
  $security_groups = ['tse-agents','tse-crossconnect', 'tse-master'],
  $subnet = 'tse-subnet-avza-1',
  $pp_department = 'TSE',
  $pp_project = 'Demo IAAI',
  $pp_created_by = 'james.jones',
  $key_name = 'jamesjones-pl3',
  $master_ip = '10.98.10.165',
  $master_host = $::fqdn,
  $agent_role = 'base',
) {

  ec2_instance { $nodename:
    ensure            => 'running',
    availability_zone => $availability_zone,
    image_id          => $image_id,
    instance_type     => $instance_type,
    key_name          => $key_name,
    region            => $region,
    security_groups   => $security_groups,
    subnet            => $subnet,
    tags              => {
      'department' => $pp_department,
      'project'    => $pp_project,
      'created_by' => $pp_created_by,
    },
    user_data         => template('data/bootstrap_agent.sh.erb'),
  }


}
