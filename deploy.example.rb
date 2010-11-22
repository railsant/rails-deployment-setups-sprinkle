# Set Application Name
set :application, "life-enrich"

# Set Repository
set :scm, :subversion
set :repository,  "http://inspiresynergy.svnrepository.com/svn/life-enrich/trunk"
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
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/id_Test"]
# set :rake, "/opt/ruby1.8.7/bin/rake"