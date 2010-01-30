require 'rubygems'
require 'sinatra'
require 'haml'

require 'models/concatenation'
require 'models/asset'

set :root, File.dirname(__FILE__)

get '/' do
  haml :index
end

[ :css, :js ].each do |type|
  get "/#{type}" do
    content_type type
    Concatenation.new(params).to_s
  end
end

get '/v' do
  @assets = Asset.all
  haml :versions
end

not_found do
  haml :'errors/not_found'
end
