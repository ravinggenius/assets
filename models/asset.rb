require 'pp'
require 'yaml'

class Asset
  attr_reader :paths

  def initialize asset_name, version
    @paths = []
    asset_root = File.expand_path(File.dirname(__FILE__) + '/../public/assets')
    @manifest = YAML.load(File.new(asset_root + '/manifest.yml'))
    raise 'invalid asset requested' unless @manifest.has_key? asset_name
    raise 'version unavailable' unless @manifest[asset_name].has_key? version
    @manifest[asset_name][version].each { |stub| @paths << "#{asset_root}/#{asset_name}/#{version}/#{stub}" }
  end
end
