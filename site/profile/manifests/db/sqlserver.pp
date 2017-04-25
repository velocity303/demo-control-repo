# Class to install SQL Server, set its configuration, create an
# instance, as well as a sample DB.
class profile::db::sqlserver (
  $source = 'F:\\',
  $admin_user = 'Administrator',
  $db_instance = 'MYINSTANCE',
  $sa_pass = 'Password$123$',
  $iso = 'SQLServer2014-x64-ENU.iso',
  $iso_source = 'https://s3-us-west-2.amazonaws.com/tseteam/files/tse_sqlserver',
  $iso_drive = 'F',
) {
  reboot { 'before install':
    when => pending,
  }

  service { 'wuauserv':
    ensure => running,
    enable => true,
    before => Windowsfeature['Net-Framework-Core'],
  }

  windowsfeature { 'Net-Framework-Core':
    ensure => present,
  }

class { '::staging':
  path  => 'C:\ProgramData\staging',
  owner => 'BUILTIN\Administrators',
  group => 'NT AUTHORITY\SYSTEM',
}

  staging::file { $iso:
    source => "${iso_source}/${iso}",
  }

  $iso_path = "${::staging::path}/${module_name}/${iso}"

  acl { $iso_path :
    permissions => [
      {
        identity => 'Everyone',
        rights   => [ 'full' ]
      },
      {
        identity => $::staging::owner,
        rights   => [ 'full' ]
      },
    ],
    require     => Staging::File[$iso],
    before      => Mount_iso[$iso_path],
    }

    mount_iso { $iso_path :
      drive_letter => $iso_drive,
    }

  sqlserver_instance{ $db_instance:
    ensure                => present,
    features              => ['SQL'],
    source                => $source,
    security_mode         => 'SQL',
    sa_pwd                => $sa_pass,
    sql_sysadmin_accounts => [$admin_user],
    require               => Mount_iso[$iso_path],
  }
  sqlserver_features { 'Management_Studio':
    source   => $source,
    features => ['SSMS'],
    require  => Mount_iso[$iso_path],
  }
  sqlserver::config{ $db_instance:
    admin_user => 'sa',
    admin_pass => $sa_pass,
    require  => Mount_iso[$iso_path],
  }

firewall_rule { 'MSSQL Access':
  ensure           => 'present',
  application_name => 'C:\Program Files\Microsoft SQL Server\MSSQL\Binn\sqlservr.exe',
  count            => '1',
  description      => 'MS SQL Server Inbound Access, enabled by Puppet in ',
  enabled          => 'true',
}
firewall_rule { 'MSSQL Browser':
  ensure           => 'present',
  application_name => 'C:\Program Files (x86)\Microsoft SQL Server\90\Shared\sqlbrowser.exe',
  count            => '1',
  description      => 'MS SQL Server Browser Inbound Access, enabled by Puppet in ',
  enabled          => 'true',
}

}
