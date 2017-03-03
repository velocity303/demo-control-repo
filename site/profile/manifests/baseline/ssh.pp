class profile::baseline::ssh {
  contain openssh
  Host <| |> -> Class['openssh']
}
