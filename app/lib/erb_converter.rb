class ErbConverter
  def initialize(erb_elements, helper_tags, symbols)
    @erb_elements, @helper_tags, @symbols = erb_elements, helper_tags, symbols
  end

  def convert_to_backbone
    backbonified = ""
    @erb_elements.each do |elements|
      elements.each do |element|
        backbonified << backboneify(element)
      end
    end
    backbonified
  end

  def backboneify(element)
    if element.class.name == "Erb::InnerText"
     ErbSnippetConverter.new(element.text_value, @helper_tags, @symbols).convert_to_backbone
   else
     element.text_value
   end
 end
end