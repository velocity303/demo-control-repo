# A profile class for setting up a chocolatey server
class profile::inf::chocolatey_server {
  require chocolatey
  include iis
  include chocolatey_server
}
