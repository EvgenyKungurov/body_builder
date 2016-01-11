# coding: utf-8
<<<<<<< HEAD
require './config/application'

use Rack::Reloader
use Rack::Static, :urls => ['/css', '/img', '/fonts', '/js'], :root => 'public/assets/'

run  LiveQueue::Application.new
=======
require './config/application.rb'
use Rack::Reloader
use Rack::Static, :urls => ['/css', '/img', '/fonts', '/js'], :root => 'public/assets/'
#use Rack::Favicon, image: "public/favicon.ico"

run  Esrc::Application.new
>>>>>>> 384f7320b0d5e76cb77f892ee5632e21e00535e0
