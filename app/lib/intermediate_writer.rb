class IntermediateWriter
  def initialize(intermediate, path)
    @intermediate, @path = intermediate, path
  end

  def write
    Dir.mkdir(@path) unless File.exists?(@path)
    File.open("#{@path}/intermediate.html.erb", "w") { |io| io.write @intermediate }
  end
end