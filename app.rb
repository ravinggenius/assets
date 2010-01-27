require 'rubygems'
require 'sinatra'
require 'haml'

set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end

# concatenate the requested js or css
#get '/c/:set' do
#  case set
#    when 
#  end
#end

not_found do
  haml :'errors/not_found'
end
