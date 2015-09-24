# == Class: gor
#
# Run an instance of Gor for traffic replay.
#
# === Parameters
#
# [*args*]
#   Hash of arguments to run Gor with. Values will be single quoted.
#
# [*package_ensure*]
#   Ensure parameter to pass to the package.
#   Default: present
#
# [*service_ensure*]
#   Ensure parameter to pass to the service.
#   Default: running
#
class gor (
  $args,
  $package_ensure = present,
  $service_ensure = running,
) {
  validate_hash($args)
  if empty($args) or empty(values($args)) {
    fail("${title}: args param is empty")
  }

  anchor { 'gor::begin': } ->
  class { 'gor::package': } ->
  class { 'gor::config': } ~>
  class { 'gor::service': } ->
  anchor { 'gor::end': }

  Anchor['gor::begin']  ~> Class['gor::service']
  Class['gor::package'] ~> Class['gor::service']
}
