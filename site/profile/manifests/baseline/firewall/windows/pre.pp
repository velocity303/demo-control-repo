class profile::baseline::firewall::windows::pre {
  Firewall_rule {
    require => undef,
  }
  # Default firewall rules

  firewall_rule { 'Core Networking - DNS (UDP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule to allow DNS requests. DNS responses based on requests that matched this rule will be permitted regardless of source address.  This behavior is classified as loose source mapping. [LSM] [UDP 53]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '*',
    protocol         => '17',
    remote_ports     => '53',
    service_name     => 'dnscache',
  }
  firewall_rule { 'Core Networking - Destination Unreachable (ICMPv6-In)':
    ensure                 => 'present',
    application_name       => 'System',
    description            => 'Destination Unreachable error messages are sent from any node that a packet traverses which is unable to forward the packet for any reason except congestion.',
    edge_traversal         => 'true',
    edge_traversal_options => '1',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes   => '1:*',
    protocol               => '58',
  }
  firewall_rule { 'Core Networking - Destination Unreachable Fragmentation Needed (ICMPv4-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'Destination Unreachable Fragmentation Needed error messages are sent from any node that a packet traverses which is unable to forward the packet because fragmentation was needed and the don’t fragment bit was set.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '3:4',
    protocol             => '1',
  }
  firewall_rule { 'Core Networking - Dynamic Host Configuration Protocol (DHCP-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Allows DHCP (Dynamic Host Configuration Protocol) messages for stateful auto-configuration.',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '68',
    protocol         => '17',
    remote_ports     => '67',
    service_name     => 'dhcp',
  }
  firewall_rule { 'Core Networking - Dynamic Host Configuration Protocol (DHCP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Allows DHCP (Dynamic Host Configuration Protocol) messages for stateful auto-configuration.',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '68',
    protocol         => '17',
    remote_ports     => '67',
    service_name     => 'dhcp',
  }
  firewall_rule { 'Core Networking - Dynamic Host Configuration Protocol for IPv6(DHCPV6-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Allows DHCPV6 (Dynamic Host Configuration Protocol for IPv6) messages for stateful and stateless configuration.',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '546',
    protocol         => '17',
    remote_ports     => '547',
    service_name     => 'dhcp',
  }
  firewall_rule { 'Core Networking - Dynamic Host Configuration Protocol for IPv6(DHCPV6-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Allows DHCPV6 (Dynamic Host Configuration Protocol for IPv6) messages for stateful and stateless configuration.',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '546',
    protocol         => '17',
    remote_ports     => '547',
    service_name     => 'dhcp',
  }
  firewall_rule { 'Core Networking - Group Policy (LSASS-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\lsass.exe',
    description      => 'Outbound rule to allow remote LSASS traffic for Group Policy updates [TCP].',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '*',
    profiles         => '1',
    protocol         => '6',
    remote_ports     => '*',
  }
  firewall_rule { 'Core Networking - Group Policy (NP-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Core Networking - Group Policy (NP-Out)',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '*',
    profiles         => '1',
    protocol         => '6',
    remote_ports     => '445',
  }
  firewall_rule { 'Core Networking - Group Policy (TCP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule to allow remote RPC traffic for Group Policy updates. [TCP]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '*',
    profiles         => '1',
    protocol         => '6',
    remote_ports     => '*',
  }
  firewall_rule { 'Core Networking - IPHTTPS (TCP-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound TCP rule to allow IPHTTPS tunneling technology to provide connectivity across HTTP proxies and firewalls.',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => 'IPHTTPS',
    protocol         => '6',
    remote_ports     => '*',
  }
  firewall_rule { 'Core Networking - IPHTTPS (TCP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound TCP rule to allow IPHTTPS tunneling technology to provide connectivity across HTTP proxies and firewalls.',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '*',
    protocol         => '6',
    remote_ports     => 'IPHTTPS',
    service_name     => 'iphlpsvc',
  }
  firewall_rule { 'Core Networking - IPv6 (IPv6-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule required to permit IPv6 traffic for ISATAP (Intra-Site Automatic Tunnel Addressing Protocol) and 6to4 tunneling services.',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    protocol         => '41',
  }
  firewall_rule { 'Core Networking - IPv6 (IPv6-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Outbound rule required to permit IPv6 traffic for ISATAP (Intra-Site Automatic Tunnel Addressing Protocol) and 6to4 tunneling services.',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    protocol         => '41',
  }
  firewall_rule { 'Core Networking - Internet Group Management Protocol (IGMP-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'IGMP messages are sent and received by nodes to create, join and depart multicast groups.',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    protocol         => '2',
  }
  firewall_rule { 'Core Networking - Internet Group Management Protocol (IGMP-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'IGMP messages are sent and received by nodes to create, join and depart multicast groups.',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    protocol         => '2',
  }
  firewall_rule { 'Core Networking - Multicast Listener Done (ICMPv6-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'Multicast Listener Done messages inform local routers that there are no longer any members remaining for a specific multicast address on the subnet.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '132:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Done (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Multicast Listener Done messages inform local routers that there are no longer any members remaining for a specific multicast address on the subnet.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '132:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Query (ICMPv6-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'An IPv6 multicast-capable router uses the Multicast Listener Query message to query a link for multicast group membership.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '130:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Query (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'An IPv6 multicast-capable router uses the Multicast Listener Query message to query a link for multicast group membership.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '130:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Report (ICMPv6-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'The Multicast Listener Report message is used by a listening node to either immediately report its interest in receiving multicast traffic at a specific multicast address or in response to a Multicast Listener Query.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '131:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Report (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'The Multicast Listener Report message is used by a listening node to either immediately report its interest in receiving multicast traffic at a specific multicast address or in response to a Multicast Listener Query.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '131:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Report v2 (ICMPv6-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'Multicast Listener Report v2 message is used by a listening node to either immediately report its interest in receiving multicast traffic at a specific multicast address or in response to a Multicast Listener Query.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '143:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Multicast Listener Report v2 (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Multicast Listener Report v2 message is used by a listening node to either immediately report its interest in receiving multicast traffic at a specific multicast address or in response to a Multicast Listener Query.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '143:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet',
  }
  firewall_rule { 'Core Networking - Neighbor Discovery Advertisement (ICMPv6-In)':
    ensure                 => 'present',
    application_name       => 'System',
    description            => 'Neighbor Discovery Advertisement messages are sent by nodes to notify other nodes of link-layer address changes or in response to a Neighbor Discovery Solicitation request.',
    edge_traversal         => 'true',
    edge_traversal_options => '1',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes   => '136:*',
    protocol               => '58',
  }
  firewall_rule { 'Core Networking - Neighbor Discovery Advertisement (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Neighbor Discovery Advertisement messages are sent by nodes to notify other nodes of link-layer address changes or in response to a Neighbor Discovery Solicitation request.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '136:*',
    protocol             => '58',
  }
  firewall_rule { 'Core Networking - Neighbor Discovery Solicitation (ICMPv6-In)':
    ensure                 => 'present',
    application_name       => 'System',
    description            => 'Neighbor Discovery Solicitations are sent by nodes to discover the link-layer address of another on-link IPv6 node.',
    edge_traversal         => 'true',
    edge_traversal_options => '1',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes   => '135:*',
    protocol               => '58',
  }
  firewall_rule { 'Core Networking - Neighbor Discovery Solicitation (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Neighbor Discovery Solicitations are sent by nodes to discover the link-layer address of another on-link IPv6 node.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '135:*',
    protocol             => '58',
  }
  firewall_rule { 'Core Networking - Packet Too Big (ICMPv6-In)':
    ensure                 => 'present',
    description            => 'Packet Too Big error messages are sent from any node that a packet traverses which is unable to forward the packet because the packet is too large for the next link.',
    edge_traversal         => 'true',
    edge_traversal_options => '1',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes   => '2:*',
    protocol               => '58',
  }
  firewall_rule { 'Core Networking - Packet Too Big (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Packet Too Big error messages are sent from any node that a packet traverses which is unable to forward the packet because the packet is too large for the next link.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '2:*',
    protocol             => '58',
  }
  firewall_rule { 'Core Networking - Parameter Problem (ICMPv6-In)':
    ensure                 => 'present',
    application_name       => 'System',
    description            => 'Parameter Problem error messages are sent by nodes as a result of incorrectly generated packets.',
    edge_traversal         => 'true',
    edge_traversal_options => '1',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes   => '4:*',
    protocol               => '58',
  }
  firewall_rule { 'Core Networking - Parameter Problem (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Parameter Problem error messages are sent by nodes as a result of incorrectly generated packets.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '4:*',
    protocol             => '58',
  }
  firewall_rule { 'Core Networking - Router Advertisement (ICMPv6-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'Router Advertisement messages are sent by routers to other nodes for stateless auto-configuration.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '134:*',
    protocol             => '58',
    remote_addresses     => 'fe80::/64',
  }
  firewall_rule { 'Core Networking - Router Advertisement (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Router Advertisement messages are sent by routers to other nodes for stateless auto-configuration.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '134:*',
    local_addresses      => 'fe80::/64',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet,fe80::/64,ff02::1-ff02::1',
  }
  firewall_rule { 'Core Networking - Router Solicitation (ICMPv6-In)':
    ensure               => 'present',
    application_name     => 'System',
    description          => 'Router Solicitation messages are sent by nodes seeking routers to provide stateless auto-configuration.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '133:*',
    protocol             => '58',
  }
  firewall_rule { 'Core Networking - Router Solicitation (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Router Solicitation messages are sent by nodes seeking routers to provide stateless auto-configuration.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '133:*',
    protocol             => '58',
    remote_addresses     => 'LocalSubnet,fe80::/64,ff02::2-ff02::2',
  }
  firewall_rule { 'Core Networking - Teredo (UDP-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound UDP rule to allow Teredo edge traversal, a technology that provides address assignment and automatic tunneling for unicast IPv6 traffic when an IPv6/IPv4 host is located behind an IPv4 network address translator.',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => 'Teredo',
    protocol         => '17',
    remote_ports     => '*',
    service_name     => 'iphlpsvc',
  }
  firewall_rule { 'Core Networking - Teredo (UDP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound UDP rule to allow Teredo edge traversal, a technology that provides address assignment and automatic tunneling for unicast IPv6 traffic when an IPv6/IPv4 host is located behind an IPv4 network address translator.',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-25000',
    local_ports      => '*',
    protocol         => '17',
    remote_ports     => '*',
    service_name     => 'iphlpsvc',
  }
  firewall_rule { 'Core Networking - Time Exceeded (ICMPv6-In)':
    ensure                 => 'present',
    application_name       => 'System',
    description            => 'Time Exceeded error messages are generated from any node that a packet traverses if the Hop Limit value is decremented to zero at any point on the path.',
    edge_traversal         => 'true',
    edge_traversal_options => '1',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes   => '3:*',
    protocol               => '58',
  }
  firewall_rule { 'Core Networking - Time Exceeded (ICMPv6-Out)':
    ensure               => 'present',
    description          => 'Time Exceeded error messages are generated from any node that a packet traverses if the Hop Limit value is decremented to zero at any point on the path.',
    direction            => '2',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-25000',
    icmp_types_and_codes => '3:*',
    protocol             => '58',
  }
  firewall_rule { 'File and Printer Sharing (Echo Request - ICMPv4-In)':
    ensure               => 'present',
    description          => 'Echo Request messages are sent as ping requests to other nodes.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-28502',
    icmp_types_and_codes => '8:*',
    profiles             => '4',
    protocol             => '1',
  }
  firewall_rule { 'File and Printer Sharing (Echo Request - ICMPv6-In)':
    ensure               => 'present',
    description          => 'Echo Request messages are sent as ping requests to other nodes.',
    enabled              => 'true',
    grouping             => '@FirewallAPI.dll,-28502',
    icmp_types_and_codes => '128:*',
    profiles             => '4',
    protocol             => '58',
  }
  firewall_rule { 'Network Discovery (LLMNR-UDP-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound rule for Network Discovery to allow Link Local Multicast Name Resolution. [UDP 5355]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '5355',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '*',
    service_name     => 'dnscache',
  }
  firewall_rule { 'Network Discovery (LLMNR-UDP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule for Network Discovery to allow Link Local Multicast Name Resolution. [UDP 5355]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '5355',
    service_name     => 'dnscache',
  }
  firewall_rule { 'Network Discovery (NB-Datagram-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule for Network Discovery to allow NetBIOS Datagram transmission and reception. [UDP 138]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '138',
    profiles         => '2',
    protocol         => '17',
    remote_ports     => '*',
  }
  firewall_rule { 'Network Discovery (NB-Datagram-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Outbound rule for Network Discovery to allow NetBIOS Datagram transmission and reception. [UDP 138]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '17',
    remote_ports     => '138',
  }
  firewall_rule { 'Network Discovery (NB-Name-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule for Network Discovery to allow NetBIOS Name Resolution. [UDP 137]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '137',
    profiles         => '2',
    protocol         => '17',
    remote_ports     => '*',
  }
  firewall_rule { 'Network Discovery (NB-Name-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Outbound rule for Network Discovery to allow NetBIOS Name Resolution. [UDP 137]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '17',
    remote_ports     => '137',
  }
  firewall_rule { 'Network Discovery (Pub WSD-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule for Network Discovery to discover devices via Function Discovery. [UDP 3702]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '3702',
    service_name     => 'fdrespub',
  }
  firewall_rule { 'Network Discovery (Pub-WSD-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound rule for Network Discovery to discover devices via Function Discovery. [UDP 3702]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '3702',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '*',
    service_name     => 'fdrespub',
  }
  firewall_rule { 'Network Discovery (SSDP-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound rule for Network Discovery to allow use of the Simple Service Discovery Protocol. [UDP 1900]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '1900',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '*',
    service_name     => 'Ssdpsrv',
  }
  firewall_rule { 'Network Discovery (SSDP-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule for Network Discovery to allow use of the Simple Service Discovery Protocol. [UDP 1900]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '1900',
    service_name     => 'Ssdpsrv',
  }
  firewall_rule { 'Network Discovery (UPnP-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule for Network Discovery to allow use of Universal Plug and Play. [TCP 2869]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '2869',
    profiles         => '2',
    protocol         => '6',
    remote_ports     => '*',
  }
  firewall_rule { 'Network Discovery (UPnP-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Outbound rule for Network Discovery to allow use of Universal Plug and Play. [TCP]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '6',
    remote_ports     => '2869',
  }
  firewall_rule { 'Network Discovery (UPnPHost-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule for Network Discovery to allow use of Universal Plug and Play. [TCP]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '6',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '2869',
    service_name     => 'upnphost',
  }
  firewall_rule { 'Network Discovery (WSD Events-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule for Network Discovery to allow WSDAPI Events via Function Discovery. [TCP 5357]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '5357',
    profiles         => '2',
    protocol         => '6',
    remote_ports     => '*',
  }
  firewall_rule { 'Network Discovery (WSD Events-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Outbound rule for Network Discovery to allow WSDAPI Events via Function Discovery. [TCP 5357]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '6',
    remote_ports     => '5357',
  }
  firewall_rule { 'Network Discovery (WSD EventsSecure-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule for Network Discovery to allow Secure WSDAPI Events via Function Discovery. [TCP 5358]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '5358',
    profiles         => '2',
    protocol         => '6',
    remote_ports     => '*',
  }
  firewall_rule { 'Network Discovery (WSD EventsSecure-Out)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Outbound rule for Network Discovery to allow Secure WSDAPI Events via Function Discovery. [TCP 5358]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '6',
    remote_ports     => '5358',
  }
  firewall_rule { 'Network Discovery (WSD-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound rule for Network Discovery to discover devices via Function Discovery. [UDP 3702]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '3702',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '*',
    service_name     => 'fdphost',
  }
  firewall_rule { 'Network Discovery (WSD-Out)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Outbound rule for Network Discovery to discover devices via Function Discovery. [UDP 3702]',
    direction        => '2',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-32752',
    local_ports      => '*',
    profiles         => '2',
    protocol         => '17',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '3702',
    service_name     => 'fdphost',
  }
  firewall_rule { 'Remote Desktop - Shadow (TCP-In)':
    ensure                 => 'present',
    application_name       => 'C:\windows\system32\RdpSa.exe',
    description            => 'Inbound rule for the Remote Desktop service to allow shadowing of an existing Remote Desktop session. (TCP-In)',
    edge_traversal         => 'true',
    edge_traversal_options => '2',
    enabled                => 'true',
    grouping               => '@FirewallAPI.dll,-28752',
    local_ports            => '*',
    profiles               => '7',
    protocol               => '6',
    remote_ports           => '*',
  }
  firewall_rule { 'Remote Desktop - User Mode (TCP-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound rule for the Remote Desktop service to allow RDP traffic. [TCP 3389]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-28752',
    local_ports      => '3389',
    profiles         => '7',
    protocol         => '6',
    remote_ports     => '*',
    service_name     => 'termservice',
  }
  firewall_rule { 'Remote Desktop - User Mode (UDP-In)':
    ensure           => 'present',
    application_name => 'C:\windows\system32\svchost.exe',
    description      => 'Inbound rule for the Remote Desktop service to allow RDP traffic. [UDP 3389]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-28752',
    local_ports      => '3389',
    profiles         => '7',
    protocol         => '17',
    remote_ports     => '*',
    service_name     => 'termservice',
  }
  firewall_rule { 'Windows Remote Management (HTTP-In)':
    ensure           => 'present',
    application_name => 'System',
    description      => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
    enabled          => 'true',
    grouping         => '@FirewallAPI.dll,-30267',
    local_ports      => '5985',
    profiles         => '4',
    protocol         => '6',
    remote_addresses => 'LocalSubnet',
    remote_ports     => '*',
  }

}
