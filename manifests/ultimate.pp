# == Class: idea::ultimate
#
# Install IntelliJ IDEA Ultimate Edition from the official vendor site.
# The required Java runtime environment will not be installed automatically.
#
# === Parameters
#
# [*version*]
#   Specify the version of IntelliJ IDEA which should be installed.
#
# [*base_url*]
#   Specify the base URL of the IntelliJ IDEA tarball. Usually this doesn't
#   need to be changed.
#
# [*url*]
#   Specify the absolute URL of the IntelliJ IDEA tarball. This overrides any
#   version which has been set before.
#
# [*build*]
#   Specify the build number of IntelliJ IDEA inside the tarball. You have to
#   specify this for every new version of IntelliJ IDEA since it doesn't match
#   the version number or anything else which could be automatically set.
#
# [*target*]
#   Specify the location of the symlink to the IntelliJ IDEA installation on
#   the local filesystem.
#
# === Variables
#
# The variables being used by this module are named exactly like the class
# parameters with the prefix 'idea_', e. g. *idea_version* and *idea_url*.
#
# === Examples
#
#  class { 'idea':
#    version => '11.1.4',
#    build   => '117.963',
#  }
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class idea::ultimate(
  $version  = 'UNSET',
  $base_url = 'UNSET',
  $url      = 'UNSET',
  $build    = 'UNSET',
  $target   = 'UNSET',
) {

  include idea::params

  $version_real = $version ? {
    'UNSET' => $::idea::params::version,
    default => $version,
  }

  $base_url_real = $base_url ? {
    'UNSET' => $::idea::params::base_url,
    default => $base_url,
  }

  $url_real = $url ? {
    'UNSET' => "${base_url_real}/ideaIU-${version_real}.tar.gz",
    default => $url,
  }

  $target_real = $target ? {
    'UNSET' => $::idea::params::target,
    default => $target,
  }

  $build_real = $build ? {
    'UNSET' => $::idea::params::build,
    default => $build,
  }

  $ultimate_build = "idea-IU-${build_real}"

  class { 'idea::base':
    version => $version_real,
    url     => $url_real,
    build   => $ultimate_build,
    target  => $target_real,
  }
}
