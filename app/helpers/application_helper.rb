module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def field_helper(builder, resource, field_name)
    %Q{
      <div class="control-group #{ 'error' if resource.errors[field_name].any? } ">
        #{ builder.label field_name, :class => 'control-label' }
        <div class="controls">
          #{ yield }
          <span class="help-inline"> #{ resource.errors[field_name].first } </span>
        </div>
      </div>
    }.html_safe
  end
end
