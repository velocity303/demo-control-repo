# A profile for installing and configuring Windows Active Directory
class profile::inf::ad {
  if $::kernel == 'Windows' {
    notify ('hello')
  }
}
