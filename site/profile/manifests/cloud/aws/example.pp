class profile::cloud::aws::example {
  profile::cloud::aws::linuxnode { 'webserver1':
    agent_role => 'generic_website',
  }
}
