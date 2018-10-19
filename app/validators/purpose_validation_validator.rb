class PurposeValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '使用可能用途を入力してください。')
    end
  end
end
