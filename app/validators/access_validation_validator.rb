class AccessValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, 'アクセスを入力してください。')
    end
  end
end
