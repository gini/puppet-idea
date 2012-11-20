# == Class: idea
#
# Install IntelliJ IDEA from the official vendor site.
# The required Java runtime environment will not be installed automatically.
#
# === Parameters
#
# [*version*]
#   Specify the version of IntelliJ IDEA which should be installed.
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
class idea(
  $version  = 'UNSET',
  $url      = 'UNSET',
  $build    = 'UNSET',
  $target   = 'UNSET',
) {
  class { 'idea::community':
    version => $version,
    url     => $url,
    build   => $build,
    target  => $target,
  }
}
