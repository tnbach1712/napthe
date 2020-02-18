module HomeHelper
  def item_link_nav( text, path, options)
    link_to path, options do
      content_tag(:span, text, class: "nav-text" )
    end
  end
end
