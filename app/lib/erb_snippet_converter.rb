class ErbSnippetConverter
  def initialize(erb_snippet, helper_tags,  attributes)
    @backbonified, @helper_tags, @attributes = erb_snippet, helper_tags, attributes
  end

  def convert_to_backbone
    pad
    convert_helper_tags
    convert_attributes
    @backbonified
  end

  private
  def pad
    @backbonified = " #{@backbonified} " unless @backbonified.start_with?(" ")
  end

  def convert_helper_tags
    @helper_tags.each { |helper_tag| convert_helper_tag(helper_tag) }
  end

  def convert_helper_tag(helper_tag)
    @attributes.each { |attribute| convert_helper_tag_attribute(helper_tag, attribute) }
  end

  def convert_helper_tag_attribute(helper_tag, attribute)
    @backbonified.gsub!(
      /(?<padding>[^a-z_])(?<helper_tag>#{helper_tag})\(#{attribute}\)/,
      '\k<padding>"\<\%\= @' + attribute.to_s + '.get(\'\k<helper_tag>\') \%\>".html_safe'
      )
    @backbonified.gsub!(
      /(?<padding>[^a-z_])(?<helper_tag>#{helper_tag}) /,
      '\k<padding>"\<\%\= @' + attribute.to_s + '.get(\'\k<helper_tag>\') \%\>".html_safe'
      )
  end

  def convert_attributes
    @attributes.each { |attribute| convert_model_attribute(attribute) }
  end

  def convert_model_attribute(attribute)
    @backbonified.gsub!(
      /(?<padding>[^a-z_])(?<variable>#{attribute})\.(?<attribute>[a-z_]+)(?<delimiter>[ ,])/,
      '\k<padding>"\<\%\= @\k<variable>.get(\'\k<attribute>\') \%\>".html_safe\k<delimiter>'
      )
  end
end