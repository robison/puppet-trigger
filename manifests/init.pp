# == Class: trigger
#
# Downloads, installs, and configures trigger, a Python-based toolchain
# for network automation
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
# node server.example.com {
#   include trigger
# }
#
# === Authors
#
# Robison Jacka (robison@packetized.io)
#
# === Copyright
#
# Copyright (c) 2014 Robison Jacka
#

class trigger(
  $version = $trigger::params::version,
  $base_url = $trigger::params::base_url,
  $packages = $trigger:params::packages,
  ) inherits trigger::params {

  package { $packages:
    ensure => present,
    before => trigger::install["trigger-${version}"],

  trigger::install { "trigger-${version}":
    onlyif => [
      'test ! -x /usr/bin/netdev'
    ]
  }
}


