# coding: utf-8
require './config/application'

use Rack::Reloader
use Rack::Static, :urls => ['/css', '/img', '/fonts', '/js'], :root => 'public/assets/'

run  LiveQueue::Application.new
