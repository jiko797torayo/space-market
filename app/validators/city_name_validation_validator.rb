class CityNameValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '市区町村を入力してください。')
    end
  end
end
