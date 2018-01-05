class AttachmentValidator < ActiveModel::EachValidator
  include ActiveSupport::NumberHelper

  def validate_each(record, attribute, value)
    has_error = false

    if options[:maximum]
      if value.byte_size > options[:maximum]
        record.errors[attribute] << (options[:message] || "は#{number_to_human_size(options[:maximum])}以下にしてください")
        has_error = true
      end
    end

    if options[:content_type]
      unless value.content_type.match?(options[:content_type])
        record.errors[attribute] << (options[:message] || 'は対応できないファイル形式です')
        has_error = true
      end
    end

    record.send(attribute).purge if options[:purge] && has_error
  end
end
