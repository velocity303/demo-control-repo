File { backup => false }

Package {
  allow_virtual => true,
}

#site {
#  consul_cluster { 'infrastructure':
#    datacenter                            => "infrastructure",
#    nodes                                 => {
#      Node['consul01.infrastructure.lab'] => Consul_cluster::Head['infrastructure'],
#      Node['consul02.infrastructure.lab'] => Consul_cluster::Node['infrastructure-0'],
#      Node['consul03.infrastructure.lab'] => Consul_cluster::Node['infrastructure-1']
#    },
#  }
#
#}

site {
   rgbank { 'dev':
     nodes => {
       Node['dockerhost01.chicago.lab'] => [
         Rgbank::Web['dev-0'],
         Rgbank::Load['dev'],
         Rgbank::Db['dev'],
       ],
     },
   }
}
node default {
  #  if !empty( $trusted['extensions']['pp_role'] ) {
  #  include "role::${trusted['extensions']['pp_role']}"
  #}
}
