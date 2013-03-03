class ErbToBackboneConverter
  def initialize(erb_buffer, intermediate_path, output_buffer, opts={})
    @erb, @intermediate_path, @output_buffer = erb_buffer.string, intermediate_path, output_buffer
    @locals = opts[:locals]
    @helper_tags = opts[:helper_tags]
  end

  def convert
    write_intermediate
    @output_buffer << render_backbone_template
  end

  def write_intermediate
    intermediate = IntermediateCreator.new(@erb, @helper_tags, @locals.keys).create
    IntermediateWriter.new(intermediate, @intermediate_path).write
  end

  def render_backbone_template
    IntermediateView.new(@intermediate_path, :locals => @locals).render
  end
end