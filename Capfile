#require "bundler/capistrano"

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require "capistrano/scm/git"
set :rbenv_type, :secondhouse
set :rbenv_ruby, '2.5.0'

#使ってたやつ
#require 'capistrano/setup'
#require 'capistrano/deploy'
#require 'capistrano/rbenv'
#set :rbenv_type, :secondhouse
#set :rbenv_ruby, '2.5.0'
#require 'capistrano/bundler'
#require 'capistrano/rails/assets'
#require 'capistrano/rails/migrations'
#require 'capistrano3/ridgepole'
#require 'capistrano3/unicorn'
#require "capistrano/scm/git"
#require 'capistrano/rails'
#ここまで



install_plugin Capistrano::SCM::Git
Dir.glob("lib/capistrano/tasks/*.rb").each { |r| import r }


# Load DSL and set up stages
#require "capistrano/setup"

# Include default deployment tasks
#require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or


# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rvm"
# require "capistrano/rbenv"
# require "capistrano/chruby"
# require "capistrano/bundler"
# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
# require "capistrano/passenger"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
