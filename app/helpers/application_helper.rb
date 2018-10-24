module ApplicationHelper
  include Pagy::Frontend

  def active_element_nav(nav_name)
    request.original_fullpath.include?(nav_name.downcase) ? 'active' : ''
  end
end
