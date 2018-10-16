class EmailValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, 'メールアドレスを入力してください。')
    elsif email !~ /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
      record.errors.add(attribute, 'メールアドレスは不正な値です。')
    end
  end
end
