require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "106.187.54.79", :web, :app, :db, primary: true

set :application, "stockinfo"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:gogotanaka/stockinfo.git"
set :branch, "master"
set :shared_children, shared_children + %w{public/uploads}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true