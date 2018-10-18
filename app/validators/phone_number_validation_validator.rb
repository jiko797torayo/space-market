class PhoneNumberValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '電話番号を入力してください。')
    elsif value !~ /^\d{10}$|^\d{11}$/
      record.errors.add(attribute, '電話番号は不正な値です。')
    end
  end
end
