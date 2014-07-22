class UsernameConventionValidator < ActiveModel::EachValidator
  def validate_each(record, field, value)
    unless value.blank?
      record.errors[field] << "is not alphanumeric (letters, numbers, underscores or periods)" unless value =~ /^[[:alnum:]._-]+$/
      record.errors[field] << "should start with a letter" unless value[0] =~ /[A-Za-z]/
      record.errors[field] << "contains illegal characters" unless value.ascii_only?
    end
  end
end