class PassingKeyMethodValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '鍵の受け渡し方法を入力してください。')
    end
  end
end
