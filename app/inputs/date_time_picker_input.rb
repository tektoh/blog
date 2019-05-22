# frozen_string_literal: true

class DateTimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: "input-group date js-datetimepicker", data: { "target-input": "nearest" }) do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat input_group_append
    end
  end

  def input_html_options
    classes = super[:class] || []
    classes << :"form-control"
    classes << :"datetimepicker-input"
    super.merge(class: classes.uniq, data: { target: ".js-datetimepicker" })
  end

  def input_group_append
    template.content_tag(:div, class: "input-group-append", data: { toggle: "datetimepicker", target: ".js-datetimepicker" }) do
      template.concat '<div class="input-group-text"><i class="fa fa-calendar"></i></div>'.html_safe
    end
  end
end
