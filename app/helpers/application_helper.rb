module ApplicationHelper

  def sortable(column, css_class = nil, title = nil)
    title ||= column.titleize
  
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
