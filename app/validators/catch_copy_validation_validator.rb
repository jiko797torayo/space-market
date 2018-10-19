class CatchCopyValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, 'スペースの見出しを64文字以内で入力してください')
    elsif value.length > 64
      record.errors.add(attribute, 'スペースの見出しを64文字以内で入力してください')
    end
  end
end
