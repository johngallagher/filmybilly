class IntermediateCreator
  def initialize(erb, helper_tags, symbols)
    @erb, @helper_tags, @symbols = erb, helper_tags, symbols
  end

  def create
    parsed_erb = parse_erb
    cleaned_elements = clean_elements(parsed_erb)
    convert_erb(cleaned_elements)
  end

  def parse_erb
    Treetop.load 'app/lib/erb'
    parsed_erb = ErbParser.new.parse(@erb)
  end

  def clean_elements(parsed_erb)
    ErbTreeCleaner.new(parsed_erb).clean
  end

  def convert_erb(cleaned_elements)
    ErbConverter.new(cleaned_elements, @helper_tags, @symbols).convert_to_backbone
  end
end