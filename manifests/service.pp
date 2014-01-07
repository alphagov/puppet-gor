# == Class gor::service
#
# This class is meant to be called from gor
# It ensure the service is running
#
class gor::service {
  include gor::params

  service { $gor::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
