# A profile class for setting up a chocolatey server
class profile::inf::chocolatey_server {
  require chocolatey
  include chocolatey_server
}
