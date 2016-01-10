#!/usr/bin/env ruby

require_relative '../admin_scripts/lib_domain'

runner = DockerRunner.new(dojo)
if !runner.installed?
  puts '..docker is NOT installed!!'
else
  puts '..docker IS installed'

  puts '..setting runner=DockerRunner in config/cyber-dojo.json'
  config_filename = dojo.config_filename
  `chmod --silent 666 #{config_filename}`
  `cp #{runner.path}#{runner.config_filename} #{config_filename}`
  `chmod 444 #{config_filename}`
  `chown www-data:www-data #{config_filename}`

  # Do not use runner anymore. It is bound to the *old* config
  puts '..refreshing DockerRunner cache'
  cache_filename = dojo.caches.path + dojo.runner.cache_filename
  `chmod --silent 666 #{cache_filename}`
  dojo.runner.refresh_cache
  `chmod 444 #{cache_filename}`
  `chown www-data:www-data #{cache_filename}`
end
