class profile::testnode {
        resources { 'user':
                purge => true,
                unless_system_user => true,
        }

        tidy {  remove_sudo_files: 
                path => '/etc/sudoers.d/',
                rmdirs => false,
                recurse => true,
                matches => ['*'],

        }

$webusersgid = hiera('webusersadmins::gid:', '1234')
group { "webusers":
        ensure => "present",
        gid => $webusersgid,
      }


file { '/etc/sudoers.d/10_webusers':
        ensure => file,
        content => "%webusers ALL=(ALL) ALL",
}

$idpusers = hiera_hash('idpadmins', false)
$idpusersdefaults = hiera_hash('idpadmins_defaults', false)

if $idpusers {
        create_resources(user, $idpusers, $idpusersdefaults)
}

}
