module ApplicationHelper

  def heading(page_heading)
    # By default, the heading will be used as the page title.
    content_for :title, page_heading
    # The heading should also appear on the page.
    content_tag :h1, page_heading
  end

  # To set the title without creating a heading, or to override the heading.
  def title(page_title)
    content_for :title, page_title
  end

  def body_classes
    css_classes = "#{controller_name} #{action_name} "
    css_classes += "signed_in" if current_user
    css_classes
  end

  def javascript_flash_messages
    # Javascript in flash_messages.js is used to display flash messages created in remote actions.
    [:notice, :alert].each do |key|
      if flash[key]
        message = flash[key]
        flash.discard key # So it doesn't show up on the next page refresh.
        return "flash_message_#{key.to_s}('#{message}');".html_safe
      end
    end
    return "".html_safe # Otherwise the [:notice, ...] array gets returned and the script fails.
  end

end
