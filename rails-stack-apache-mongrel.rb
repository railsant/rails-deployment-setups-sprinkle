require "#{File.dirname(__FILE__)}/helper"

policy :rails_stack_apache_mongrel, :roles => :app do
  # Install Common Packages such as vim, curl, see packages/tools.rb and packages/settings.rb
  requires :tools
  requires :settings
  # Install Ruby, Please change the version and patch level in packages/ruby.rb
  requires :ruby
  # Install the Web Server Apache, see packages/webserver-apache.rb
  requires :apache
  # Install the App Server Mongrel, see packages/appserver-mongrel.rb
  requires :mongrel
  # Please edit the configurations/mongrel.conf
  requires :mongrel_configuration
  # Install the gem Rails, Please change the version in packages/rails.rb
  requires :rails
  # Install the Database Driver
  requires :mysql
  # Install the SCM
  requires :svn
end

deployment do
  delivery :capistrano do
    recipes "#{File.dirname(__FILE__)}/../deploy"
  end

  source do
    prefix   '/usr/local'           # where all source packages will be configured to install
    archives '/usr/local/sources'   # where all source packages will be downloaded to
    builds   '/usr/local/build'     # where all source packages will be built
  end
end
