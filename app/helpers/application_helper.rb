module ApplicationHelper
  def full_title(title = '')
    base_title = "MembersOnly App"
    return title.empty? ? base_title : "#{title.capitalize} - #{base_title}"
  end
end
