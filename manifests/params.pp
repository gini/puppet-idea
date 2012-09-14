# == Class: idea::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class idea::params {
  $version = $::idea_version ? {
    undef   => '11.1.3',
    default => $::idea_version
  }

  $base_url = $::idea_base_url ? {
    undef   => 'http://download.jetbrains.com/idea',
    default => $::idea_base_url,
  }

  $community_url = $::idea_community_url ? {
    undef   => "${base_url}/ideaIC-${version}.tar.gz",
    default => $::idea_community_url,
  }

  $ultimate_url = $::idea_ultimate_url ? {
    undef   => "${base_url}/ideaIU-${version}.tar.gz",
    default => $::idea_ultimate_url,
  }

  $build = $::idea_build ? {
    undef   => '117.798',
    default => $::idea_build,
  }

  $community_build = $::idea_community_build ? {
    undef   => "idea-IC-${build}",
    default => $::idea_community_build,
  }

  $ultimate_build = $::idea_ultimate_build ? {
    undef   => "idea-IU-${build}",
    default => $::idea_ultimate_dir,
  }

  $target = $::idea_target ? {
    undef   => '/opt/idea',
    default => $::idea_target,
  }
}
