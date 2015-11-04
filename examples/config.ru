# coding: utf-8
require './config/application.rb'
use Rack::Reloader
use Rack::Static, :urls => ['/css', '/img', '/fonts', '/js'], :root => 'public/assets/'
#use Rack::Favicon, image: "public/favicon.ico"

run  Esrc::Application.new