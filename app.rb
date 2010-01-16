require 'rubygems'
require 'sinatra'
require 'haml'

set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end

not_found do
  'Couldn\t find it. Sorry about that.'
end
