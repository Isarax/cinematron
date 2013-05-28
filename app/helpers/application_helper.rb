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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
