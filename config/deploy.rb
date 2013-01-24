require "bundler/capistrano"
require 'capistrano-db-tasks'

ssh_options[:forward_agent] = true

set :application, "Vulgarities"
set :repository,  "git@github.com:artfuldodger/vulgarities.git"
set :user, 'ubuntu'
set :scm, :git

set :deploy_to, "/var/www/vulgarities"

role :web, "ec2-23-20-126-175.compute-1.amazonaws.com"                   # Your HTTP server, Apache/etc
role :app, "ec2-23-20-126-175.compute-1.amazonaws.com"                   # This may be the same as your `Web` server
role :db,  "ec2-23-20-126-175.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run

# Clean up old releases on each deploy:
after "deploy:restart", "deploy:cleanup"

# For capistrano-db-tasks
set :rails_env, "production"
set :db_local_clean, true # if you want to remove the dump file after loading

# Required for Passenger mod_rails:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end