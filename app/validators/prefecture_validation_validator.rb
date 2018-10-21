class PrefectureValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '都道府県を入力してください。')
    end
  end
end
