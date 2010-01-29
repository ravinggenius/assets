class Concatenation
  GLUE = "\n\n\n\n\n"

  def initialize params
    @assets = params.map { |name, version| Asset.find name, version }
  end

  def to_s
    reply = @assets.map { |asset| asset.to_s }
    reply.join GLUE
  end
end
