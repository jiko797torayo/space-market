class PostalCodeValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '郵便番号を入力してください。')
    elsif value !~ /^\d{7}$/
      record.errors.add(attribute, '郵便番号は不正な値です。')
    end
  end
end
