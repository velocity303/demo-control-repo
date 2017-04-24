class profile::baseline {

    include profile::baseline::hosts
    include profile::baseline::users
    include profile::baseline::packages
    include profile::baseline::banner
    include profile::baseline::remote_access
    include profile::baseline::firewall
    include profile::baseline::security
    include profile::baseline::time
    include profile::baseline::path
    include profile::baseline::puppet_agent
    include profile::baseline::monitoring
    include profile::baseline::misc

}

