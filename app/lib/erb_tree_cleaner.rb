class ErbTreeCleaner
  def initialize(erb_tree)
    @erb_tree = erb_tree
  end

  def clean
    cleaned_elements = []
    @erb_tree.elements.each do |element|
      cleaned_element = clean_tree(element)
      cleaned_elements << cleaned_element
    end
    cleaned_elements
  end

  private
  def clean_tree(root_node)
    return if(root_node.elements.nil?)
    root_node.elements.delete_if { |node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each      { |node| clean_tree(node) }
  end
end