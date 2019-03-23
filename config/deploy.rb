# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "pmtools"
# Репозиторий
set :repo_url, 'git@github.com:MihailHiminec/pmtools.git'
# Используемое окружение
set :rails_env, 'production'
# Имя пользователя
set :username, 'deploy'
# Путь для деплоя
set :deploy_to, "/home/#{fetch(:username)}/#{fetch(:application)}"

set :log_level, :info

set :linked_dirs, %w{public/upload}

set :linked_files, %w{config/credentials.yml.enc config/database.yml}
# set :linked_files, fetch(:linked_files, [])
#                        .push('config/database.yml', 'config/credentials.yml.enc')

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :setup do
  desc 'Загрузка конфигурационных файлов на удаленный сервер'
  task :upload_config do
    on roles :all do
      execute :mkdir, "-p #{shared_path}"
      ['shared/config', 'shared/run'].each do |f|
        upload!(f, shared_path, recursive: true)
      end
    end
  end
end

namespace :nginx do
  desc 'Создание симлинка в /etc/nginx/conf.d на nginx.conf приложения'
  task :append_config do
    on roles :all do
      sudo :ln, "-fs #{shared_path}/config/nginx.conf /etc/nginx/conf.d/#{fetch(:application)}.conf"
    end
  end
  desc 'Релоад nginx'
  task :reload do
    on roles :all do
      sudo :service, :nginx, :reload
    end
  end
  desc 'Рестарт nginx'
  task :restart do
    on roles :all do
      sudo :service, :nginx, :restart
    end
  end
  after :append_config, :restart
end

set :unicorn_config, "#{shared_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/run/unicorn.pid"

namespace :application do
  desc 'Запуск Unicorn'
  task :start do
    on roles(:app) do
      execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec unicorn_rails -c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end
  desc 'Завершение Unicorn'
  task :stop do
    on roles(:app) do
      execute "if [ -f #{fetch(:unicorn_pid)} ] && [ -e /proc/$(cat #{fetch(:unicorn_pid)}) ]; then kill -9 `cat #{fetch(:unicorn_pid)}`; fi"
    end
  end
end

namespace :deploy do
# task :updated do
#   sudo :ln, "-fs #{shared_path}/config/database.conf #{release_path}/config/database.conf"
# end

  task :setup_config do
    on roles :all do
      run "ln -fs #{shared_path}/config/database.conf #{release_path}/config/database.conf"
    end
  end

  
  after :finishing, 'application:stop'
  after :finishing, 'application:start'
  after :finishing, :cleanup
end