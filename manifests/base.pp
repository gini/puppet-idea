# == Class: idea::base
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
#   Specify the directory of IntelliJ IDEA inside the tarball. You have to
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
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class idea::base(
  $version,
  $url,
  $build,
  $target,
) {

  Exec {
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    owner   => 'root',
    group   => 'root',
  }

  archive { "Download IntelliJ IDEA ${version}":
    ensure     => present,
    url        => $url,
    checksum   => false,
    src_target => '/var/tmp',
    target     => '/opt',
    extension  => 'tar.gz',
  }

  file { $target:
    ensure  => link,
    target  => "/opt/${build}",
    require => Archive["Download IntelliJ IDEA ${version}"],
  }
}
