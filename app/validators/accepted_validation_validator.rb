class AcceptedValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value == false
      record.errors.add(attribute, 'スペースマーケット利用規約を受諾してください。')
    end
  end
end
