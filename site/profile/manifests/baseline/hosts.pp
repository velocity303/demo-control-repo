class profile::baseline::hosts {
  if $::kernel == 'Linux' {
    include profile::baseline::hosts::linux
  }
  elsif $::kernel == 'windows' {
    include profile::baseline::hosts::windows
  }
}
