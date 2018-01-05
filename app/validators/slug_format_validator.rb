class SlugFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.match? /\A(?=.*[a-z])[a-z\d]+\Z/i
    record.errors[attribute] << (options[:message] || 'は英数字で入力してください')
  end
end
