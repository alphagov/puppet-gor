# == Class: gor
#
# Full description of class gor here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class gor (
) inherits gor::params {

  # validate parameters here

  anchor { 'gor::begin': } ->
  class { 'gor::install': } ->
  class { 'gor::config': }
  class { 'gor::service': } ->
  anchor { 'gor::end': }

  Anchor['gor::begin']  ~> Class['gor::service']
  Class['gor::install'] ~> Class['gor::service']
  Class['gor::config']  ~> Class['gor::service']
}
