class StreetNameValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '町名・番地を入力してください。')
    end
  end
end
