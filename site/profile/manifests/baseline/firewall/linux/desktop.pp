class profile::baseline::firewall::linux::desktop {
  #  firewall { '100 allow tcp kde-connect access':
  #  dport  => '1714-1764',
  #  proto  => tcp,
  #  action => accept,
  #}
  #firewall { '100 allow udp kde-connect access':
  #  dport  => '1714-1764',
  #  proto  => udp,
  #  action => accept,
  #}
  firewall { '100 allow chromecast access':
    dport  => '1714-1764',
    proto  => udp,
    action => accept,
  }
  firewall { '100 allow chromecast access':
    dport  => '1714-1764',
    proto  => udp,
    action => accept,
  }

}
