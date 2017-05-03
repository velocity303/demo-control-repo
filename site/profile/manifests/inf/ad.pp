# A profile for installing and configuring Windows Active Directory
class profile::inf::ad (
  $domain_name,
){
  $domain_admin_pass = hiera('domain_admin_pass'),
  dsc_windowsfeature { 'rsat-adds':
    ensure => present,
    dsc_name => 'rsat-adds',
  }

  dsc_windowsfeature { 'ad-domain-services':
    ensure => present,
    dsc_name => 'ad-domain-services',
  } ->

  dsc_xaddomain { $domain_name:
    ensure => present,
    dsc_domainname => $domain_name,
    dsc_domainadministratorcredential =>  { user => 'Administrator', password => $domain_admin_pass },
    dsc_safemodeadministratorpassword => { user => 'Administrator', password => $domain_admin_pass },
    notify => Reboot['dsc_reboot'],
  }

  dsc_xaddomaincontroller { 'lab':
    dsc_domainname => $domain_name,
    dsc_domainadministratorcredential =>  { user => 'Administrator', password => $domain_admin_pass },
    dsc_safemodeadministratorpassword => { user => 'Administrator', password => $domain_admin_pass },
    notify => Reboot['dsc_reboot'],
  }
}
