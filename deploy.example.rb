# Set Application Name
set :application, "Application Name Here"

# Set Repository
set :scm, :subversion
set :repository,  "http://path/to/repository"
set :scm_username, Proc.new { Capistrano::CLI.password_prompt("SVN username please: ") }
set :scm_password, Proc.new { Capistrano::CLI.password_prompt("SVN password for #{scm_username}, please: ") }

# Set Deployment Server Information, Change to use role if you want to deploy to multiple servers
server "Server IP/Domain Here", :app, :web, :db, :primary => true
# role :web, "Web Server IP/Domain Here"                        # Your HTTP server, Apache/etc
# role :app, "App Server IP/Domain Here"                        # This may be the same as your `Web` server
# role :db,  "DB Master IP/Domain Here", :primary => true       # This is where Rails migrations will run
# role :db,  "DB Slave IP/Domain Here"
set :deploy_to, "/var/applications/#{application}"
set :user, 'Server User Name Here'
set :use_sudo, false
# set :password, ''
# Set SSH Key Below
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/id_rsa"]
# set :rake, "/opt/ruby1.8.7/bin/rake"

require 'bundler/capistrano'

# Uncomment the following lines if you use the Mongrel Server
# set :mongrel_conf, "#{release_path}/config/mongrel_cluster.yml"
# require 'mongrel_cluster/recipes'

# Run cap deploy:db:create
namespace :deploy do
  namespace :db do
    desc 'Create the Production Database'
    task :create, :roles => :db do
      run "cd #{release_path} && rake db:create RAILS_ENV=production"
    end
  end
end
