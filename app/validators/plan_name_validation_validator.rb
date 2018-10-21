class PlanNameValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, 'プランの名称を入力してください')
    end
  end
end
