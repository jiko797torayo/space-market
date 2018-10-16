class PasswordValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, 'パスワードを入力してください。')
    elsif value.length < 8
      record.errors.add(attribute, 'パスワードは8文字以上で入力してください。')
    elsif value.length > 128
      record.errors.add(attribute, 'パスワードは128文字以内で入力してください。')
    end
  end
end
