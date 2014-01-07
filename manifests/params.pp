# == Class gor::params
#
# This class is meant to be called from gor
# It sets variables according to platform
#
class gor::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'gor'
      $service_name = 'gor'
    }
    'RedHat', 'Amazon': {
      $package_name = 'gor'
      $service_name = 'gor'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
