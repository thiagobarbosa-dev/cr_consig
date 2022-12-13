# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "cr_consig"
set :repo_url, "git@github.com:thiagobarbosa48/cr_consig.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/cr_consig"
set :linked_dirs, %w{public/uploads}

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
set :default_env, { path: "~/.asdf/installs/ruby/3.1.2/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


set :migration_role, :app

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"

set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"

set :rvm_ruby_version, '3.1.2'

namespace :puma do

  desc 'Create Puma dirs'
  task :create_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  desc "Restart Nginx"
  task :nginx_restart do
    on roles(:app) do
      execute "sudo service nginx restart"
    end
  end
  
  before :start, :create_dirs
  after :start, :nginx_restart
end

namespace :rails do
  desc 'Tail remote log files'
  task :logs do
    on roles :app do
      logfile = ENV['LOG'] || fetch(:rails_env)
      execute %(tail -n 50 -f #{shared_path}/log/#{logfile}.log | while read line; do echo "$line"; done)
    end
  end
end

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
  
  desc 'Restart application'
    task :restart do
      invoke 'puma:stop'
      invoke 'puma:start'
  end

  before :updated, 'yarn:install'
  before :updated, 'yarn:build'

  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

desc 'Invoke a rake command on the remote server'
task :invoke, [:command] => 'deploy:set_rails_env' do |task, args|
  on primary(:app) do
    within current_path do
      with :rails_env => fetch(:rails_env) do
        rake args[:command]
      end
    end
  end
end

namespace :yarn do
  desc 'Install yarn dependencies'
  task :install do
    on roles(:app) do
      within release_path do
        execute :yarn, :install
      end
    end
  end

  desc 'yarn dependencies'
  task :build do
    on roles(:app) do
      within release_path do
        with node_env: :production do
          execute :yarn, :build
          execute :yarn, 'build:css'
        end
      end
    end
  end
end
