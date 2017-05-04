# A profile for installing and configuring Windows Active Directory
class profile::inf::ad (
  $domain_name,
){

  reboot { 'dsc_reboot_1' :
    message => 'DSC has requested a reboot',
    apply   => 'immediately',
  }

  reboot { 'dsc_reboot_2' :
    message => 'DSC has requested a reboot',
    apply   => 'immediately',
  }

  file { ['c:\NTDS','c:\SYSVOL']:
    ensure => directory,
  }

  $domain_admin_pass = hiera('domain_admin_pass')
  dsc_windowsfeature { 'rsat-adds':
    ensure   => present,
    dsc_name => 'rsat-adds',
  }

  dsc_windowsfeature { 'ad-domain-services':
    ensure   => present,
    dsc_name => 'ad-domain-services',
  } ->

  dsc_xaddomain { $domain_name:
    ensure                            => present,
    dsc_domainname                    => $domain_name,
    dsc_domainadministratorcredential =>  {
      user     => 'Administrator',
      password => $domain_admin_pass,
    },
    dsc_safemodeadministratorpassword => {
      user     => 'Administrator',
      password => $domain_admin_pass,
    },
    dsc_databasepath                  => 'c:\NTDS',
    dsc_logpath                       => 'c:\NTDS',
    dsc_sysvolpath                    => 'c:\SYSVOL',
    notify                            => Reboot['dsc_reboot_1'],
    require                           => File['c:\NTDS','c:\SYSVOL'],
  } ->

  service { ['ADWS','NTDS','Netlogon','IsmServ','DFSR', 'kdc']:
    ensure  => 'running',
    enable  => 'true',
    require => Dsc_windowsfeature['ad-domain-services'],
  }


  dsc_xaddomaincontroller { 'portland.lab':
    dsc_domainname                    => $domain_name,
    dsc_domainadministratorcredential =>  {
      user     => 'Administrator',
      password => $domain_admin_pass
    },
    dsc_safemodeadministratorpassword => {
      user     => 'Administrator',
      password => $domain_admin_pass
    },
    require                           => Service['ADWS'],
    notify                            => Reboot['dsc_reboot_2'],
  }
}
