require 'yaml'

class Asset
  ASSET_ROOT = File.expand_path File.dirname(__FILE__) + '/../assets'
  GLUE = "\n\n\n"

  attr_reader :paths

  def initialize stubs
    @stubs = stubs || []
  end

  def to_s
    reply = @stubs.map { |stub| File.read "#{ASSET_ROOT}/#{stub}" }
    reply.join GLUE
  end

  def self.all
    store
  end

  def self.find name, version
    @manifest ||= store
    raise 'invalid asset requested' unless @manifest.has_key? name
    raise 'version unavailable' unless @manifest[name].has_key? version
    Asset.new @manifest[name][version]
  end

  private

  def self.store
    YAML.load File.new ASSET_ROOT + '/manifest.yml'
  end
end
