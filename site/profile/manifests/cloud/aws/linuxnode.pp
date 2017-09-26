define profile::cloud::aws::linuxnode (
  $nodename = $title,
  $availability_zone = 'us-west-2b',
  $image_id = 'ami-9fa343e7',
  $region = 'us-west-2',
  $instance_type = 'm3.medium',
  $security_groups = ['Web Traffic Agent', 'default'],
  $subnet = 'subnet-d45073b0',
  $pp_department = 'TSE',
  $pp_project = 'wwt-aws-demo',
  $pp_created_by = 'james.jones',
  $key_name = 'james.jones-2',
  $master_ip = '172.31.29.68',
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
