require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sass/plugin/rack'
require 'aws-sdk-v1'
require './route'


Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sinatra::Application