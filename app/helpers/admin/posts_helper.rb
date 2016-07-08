module Admin::PostsHelper
  # Set table header to sorting link
  def sortable(column, title = nil)
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    
    if not(css_class.nil?)
      icon_direction = sort_direction == "asc" ? "<i class='fa fa-caret-up'></i>" : "<i class='fa fa-caret-down'></i>"
    end
    
    title ||= column.titleize + " #{icon_direction}"
    link_to title.html_safe, { sort: column, direction: direction }, { class: css_class }
  end
end
