package :ruby do
  description 'Ruby Virtual Machine'
  # Change the Ruby Version Below
  version '1.8.7'
  # Change the Version Patchlevel Below
  patchlevel '302'
  source "ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-#{version}-p#{patchlevel}.tar.gz"
  requires :ruby_dependencies
  verify { has_executable_with_version "/usr/local/bin/ruby", version }
end

package :ruby_dependencies do
  description 'Ruby Virtual Machine Build Dependencies'
  apt %w( bison zlib1g-dev libssl-dev libreadline5-dev libncurses5-dev file )
end
