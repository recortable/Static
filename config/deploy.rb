set :application, "Static"
set :deploy_to, "/home/deploy/#{application}"
set :user, "deploy"
set :use_sudo, false

set :scm, "git"
set :repository,  "git://github.com/recortable/Static.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, true

role :app, "recortable.net"
role :web, "recortable.net"
role :db,  "recortable.net", :primary => true

#after "deploy:update_code", "config:copy_shared_configurations"
after "deploy", "deploy:cleanup"

# Configuration Tasks
namespace :config do
  desc "copy shared configurations to current"
  task :copy_shared_configurations, :roles => [:app] do
    %w[database.yml].each do |f|
      run "ln -nsf #{shared_path}/config/#{f} #{release_path}/config/#{f}"
    end
  end
end


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    #run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end