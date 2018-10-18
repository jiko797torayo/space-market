class EquipmentTypeValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '施設の種類を入力してください。')
    end
  end
end
