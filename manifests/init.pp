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
# [*envvars*]
#   Environment variables to be passed into the upstart config. This could
#   be used to turn on debugging options.
#
# [*binary_path*]
#   Specify the location of the Gor binary.
#
class gor (
  $args,
  $package_ensure = present,
  $service_ensure = running,
  $envvars = {},
  $binary_path = '/usr/bin/gor',
) {
  validate_hash($args)
  if empty($args) or empty(values($args)) {
    fail("${title}: args param is empty")
  }

  validate_hash($envvars)

  anchor { 'gor::begin': } ->
  class { 'gor::package': } ->
  class { 'gor::config': } ~>
  class { 'gor::service': } ->
  anchor { 'gor::end': }

  Anchor['gor::begin']  ~> Class['gor::service']
  Class['gor::package'] ~> Class['gor::service']
}
