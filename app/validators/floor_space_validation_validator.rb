class FloorSpaceValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '床面積を入力してください。')
    end
    unless value.to_i > 0
      record.errors.add(attribute, '床面積は不正な値です。')
    end
  end
end
