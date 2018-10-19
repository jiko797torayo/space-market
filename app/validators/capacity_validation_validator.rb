class CapacityValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '最大収容人数を入力してください。')
    elsif value !~ /^[1-9999]+$/
      record.errors.add(attribute, '最大収容人数は不正な値です。')
    end
  end
end
