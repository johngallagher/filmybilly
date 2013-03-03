class TemplateView < ActionView::Base
  def protect_against_forgery?
    false
  end

  def path_to_image(src)
    if contains_backbone?(src)
      src
    else
      super
    end
  end

  def image_alt(src)
    if contains_backbone?(src)
      matching_symbols(src).first.capitalize
    else
      super
    end
  end

  def render(*args)
    @symbols = args.first[:locals].keys
    super
  end

  private
  def first_local_symbol
    @locals.keys.first.to_s
  end

  def contains_backbone?(src)
    matching_symbols(src).count > 0
  end

  def matching_symbols(src)
    @symbols.select { |symbol| contains_backbone_for_symbol?(src, symbol) }
  end

  def contains_backbone_for_symbol?(src, symbol)
    src.start_with?('<%= '+ symbol.to_s + '.get(\'')
  end
end