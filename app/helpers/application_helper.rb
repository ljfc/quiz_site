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

end
