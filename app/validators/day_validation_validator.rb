class DayValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.past?
      record.errors.add(attribute, '過去の日付は予約できません')
    end
  end
end
