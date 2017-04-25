class role::tomcat_jenkins {
  include profile::baseline
  include profile::app::jenkins
}
