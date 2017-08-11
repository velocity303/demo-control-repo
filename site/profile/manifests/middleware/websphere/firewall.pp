class profile::middleware::websphere::firewall {
  #Adding firewall rules as outlined here: https://www.ibm.com/support/knowledgecenter/en/SS7JFU_8.0.0/com.ibm.websphere.migration.express.iseries.doc/info/iseriesexp/ae/rmig_portnumber.html

  firewall { '100 Administrative Console Port (WC_ adminhost)':
    proto  => 'tcp',
    dport  => '9060',
    action => 'accept',
  }

  firewall { '100 Administrative Console Secure Port (WC_ adminhost_ secure)':
    proto  => 'tcp',
    dport  => '9043',
    action => 'accept',
  }

  firewall { '100 HTTP Transport Port (WC_ defaulthost)':
    proto  => 'tcp',
    dport  => '9080',
    action => 'accept',
  }

  firewall { '100 SOAP Connector Port (SOAP_ CONNECTOR_ ADDRESS)':
    proto  => 'tcp',
    dport  => ['8879', '8880'],
    action => 'accept',
  }

  firewall { '100 Bootstrap Port (BOOTSTRAP_ ADDRESS)':
    proto  => 'tcp',
    dport  => '2809',
    action => 'accept',
  }

  firewall { '100 CSIV2 Client Authentication Listener Port (CSIV2_ SSL_ MUTUALAUTH_ LISTENER_ ADDRESS)':
    proto  => 'tcp',
    dport  => '9402',
    action => 'accept',
  }

  firewall { '100 CSIV2 Server Authentication Listener Port (CSIV2_ SSL_ SERVERAUTH_ LISTENER_ ADDRESS)':
    proto  => 'tcp',
    dport  => '9403',
    action => 'accept',
  }

  firewall { '100 High Availability Manager Communication Port (DCS_ UNICAST_ ADDRESS)':
    proto  => 'tcp',
    dport  => '9353',
    action => 'accept',
  }

  firewall { '100 Internal JMS Server Port (JMSSERVER_ SECURITY_ PORT)':
    proto  => 'tcp',
    dport  => '5557',
    action => 'accept',
  }

  firewall { '100 IPC Connector Port (IPC_ CONNECTOR_ ADDRESS)':
    proto  => 'tcp',
    dport  => '9633',
    action => 'accept',
  }

  firewall { '100 MQ Transport Port (SIB_ MQ_ ENDPOINT_ ADDRESS)':
    proto  => 'tcp',
    dport  => '5558',
    action => 'accept',
  }

  firewall { '100 MQ Transport Secure Port (SIB_ MQ_ ENDPOINT_ SECURE_ ADDRESS)':
    proto  => 'tcp',
    dport  => '5578',
    action => 'accept',
  }

  firewall { '100 ORB Listener Port (ORB_ LISTENER_ ADDRESS)':
    proto  => 'tcp',
    dport  => '9100',
    action => 'accept',
  }


  firewall { '100 SAS_ SSL_ SERVERAUTH_ LISTENER_ ADDRESS':
    proto  => 'tcp',
    dport  => '9401',
    action => 'accept',
  }

  firewall { '100 Service Integration Port (SIB_ ENDPOINT_ ADDRESS)':
    proto  => 'tcp',
    dport  => '7276',
    action => 'accept',
  }

  firewall { '100 Service Integration Secure Port (SIB_ ENDPOINT_ SECURE_ ADDRESS)':
    proto  => 'tcp',
    dport  => '7286',
    action => 'accept',
  }

  firewall { '100 SIP Container Port (SIP_ DEFAULTHOST)':
    proto  => 'tcp',
    dport  => '5060',
    action => 'accept',
  }

  firewall { '100 IBM HTTP Server Port':
    proto  => 'tcp',
    dport  => '80',
    action => 'accept',
  }

  firewall { '100 IBM HTTPS Server Administration Port':
    proto  => 'tcp',
    dport  => '8008',
    action => 'accept',
  }

}
