module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def show_field(field)
    unless field.blank? 
      field
    else 
      'None'
    end
  end

  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end
end
