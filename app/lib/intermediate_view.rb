class IntermediateView
  def initialize(path, opts={})
    @path = path
    @locals = opts[:locals]
  end

  def render
    final = TemplateView.new(@path)
    final.render(:template => "intermediate", :handlers => [:erb], :locals => @locals)
  end
end