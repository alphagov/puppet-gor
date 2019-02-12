# == Class: gor::package
#
# Private class. Should not be called directly.
#
class gor::package {
  $package_name = $::gor::package_name
  $package_ensure = $::gor::package_ensure

  package { $package_name:
    ensure => $package_ensure,
  }
}
