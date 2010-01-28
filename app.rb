require 'rubygems'
require 'sinatra'
require 'haml'

require 'models/concatenation'
require 'models/asset'

set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end

get '/js' do
  concatenation = Concatenation.new
  params.each do |asset, version|
    concatenation.assets << Asset.new(asset, version)
  end
  content_type :js
  concatenation.to_s
end

not_found do
  haml :'errors/not_found'
end
