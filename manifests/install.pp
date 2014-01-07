# == Class gor::install
#
class gor::install {
  include gor::params

  package { $gor::params::package_name:
    ensure => present,
  }
}
