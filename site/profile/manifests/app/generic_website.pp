# Example cross platform generic website class
class profile::app::generic_website {
  if $::kernel == 'Windows' {
    $doc_root = 'C:\inetpub\wwwroot\generic_website'

    $iis_features = [
      'Web-Server',
      'Web-WebServer',
      'Web-Http-Redirect',
      'Web-Mgmt-Console',
      'Web-Mgmt-Tools',
    ]

    windowsfeature { $iis_features:
      ensure => present,
    }

    iis::manage_site {'Default Web Site':
      ensure => absent,
    }

    iis::manage_app_pool {'generic_website':
      require => [
        Windowsfeature['Web-Server'],
        Iis::Manage_site['Default Web Site'],
      ],
    }

    iis::manage_site { $::fqdn:
      site_path  => $doc_root,
      port       => '80',
      ip_address => '*',
      app_pool   => 'generic_website',
      require    => [
        Windowsfeature['Web-Server'],
        Iis::Manage_app_pool['generic_website']
      ],
    }

    windows_firewall::exception { 'WINRM':
      ensure       => present,
      direction    => 'in',
      action       => 'Allow',
      enabled      => 'yes',
      protocol     => 'TCP',
      local_port   => '80',
      display_name => 'HTTP Inbound',
      description  => 'Inbound rule for HTTP Server - Port 80',
    }

    staging::file { 'pl_generic_site.zip':
      source => 'puppet:///modules/profile/pl_generic_site.zip',
    }

    unzip { 'pl_generic_site.zip':
      source  => 'C:\\ProgramData\\staging\\profile\\pl_generic_site.zip',
      creates => "${doc_root}\\index.html",
      require => Iis::Manage_site[$::fqdn],
    }
  } elsif $::kernel == 'Linux' {

      if !defined(Package['unzip']) {
        package {'unzip': ensure => present, }
      }

      $doc_root = '/var/www/generic_website'
      class { 'apache':
        default_vhost => false,
      }

      file { $doc_root:
        ensure => directory,
        owner  => $::apache::user,
        group  => $::apache::group,
        mode   => '0755',
      }

      apache::vhost { $::fqdn:
        port    => '80',
        docroot => $doc_root,
        require => File[$doc_root],
      }

      staging::deploy { 'pl_generic_site.zip':
        source  => 'puppet:///modules/profile/pl_generic_site.zip',
        target  => $doc_root,
        require => Apache::Vhost[$::fqdn],
        creates => "${doc_root}/index.html",
      }
      consul::service { 'apache':
        checks  => [
          {
            id       => 'generic_website',
            http     => 'http://localhost:80',
            interval => '10'
          }
        ],
        port    => 80,
      }

      firewall { '100 allow https':
        proto  => 'tcp',
        dport  => '443',
        action => 'accept',
      }

      firewall { '100 allow http':
        proto  => 'tcp',
        dport  => '80',
        action => 'accept',
      }


    }



}
