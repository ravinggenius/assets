require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

require 'models/concatenation'
require 'models/asset'

configure do
  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)
  set :haml, { :format => :html5, :attr_wrapper => '"' }

  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
  end

  set :sass, Compass.sass_engine_options
end

get '/styles/:name.css' do
  content_type :css, :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}"
end

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
