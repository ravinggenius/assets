class Concatenation
  GLUE = "\n\n\n\n\n"
  attr_accessor :assets

  def initialize
    @assets ||= []
  end

  def to_s
    reply = []
    @assets.each do |asset|
      asset.paths.each { |path| reply << File.read(path) }
    end
    reply.join GLUE
  end
end
