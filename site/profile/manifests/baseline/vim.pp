class profile::baseline::vim {
  require git
  case $osfamily {
    'RedHat': { $vim_pkg = 'vim-enhanced' }
    'Debian': { $vim_pkg = 'vim' }
    default: { fail("unsupported operating system") }
  }
  $users = {
   'james' => '/home/james',
   'root'  => '/root'
  }
  package { $vim_pkg:
    ensure => installed,
  }
  $users.each |$user, $homedir| {
    puppet_vim_env::install { "default vim for ${user}":
      homedir     => $homedir,
      owner       => $user,
      colorscheme => 'elflord',
    }
  }
}
