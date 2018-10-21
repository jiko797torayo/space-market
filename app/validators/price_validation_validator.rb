class PriceValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '価格を入力してください')
    end
    unless value.to_i > 0
      record.errors.add(attribute, '価格は不正な値です。')
    end
  end
end
