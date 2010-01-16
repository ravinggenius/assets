require 'rubygems'
require 'sinatra'
require 'haml'

set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end

not_found do
  haml :'errors/not_found'
end
