module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def create_field(builder, resource, field_name)
    %Q{
      <div class="control-group #{ 'error' if resource.errors[field_name].any? } ">
        #{ builder.label field_name, class: 'control-label' }
        <div class="controls">
          #{ yield }
          <span class="help-inline"> #{ resource.errors[field_name].first } </span>
        </div>
      </div>
    }.html_safe
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
