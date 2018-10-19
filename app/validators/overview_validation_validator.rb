class OverviewValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, 'スペースについて10文字以上800文字以内で入力してください')
    elsif value.length < 10
      record.errors.add(attribute, 'スペースについて10文字以上入力してください')
    elsif value.length > 800
      record.errors.add(attribute, 'スペースについて800文字以内で入力してください')
    end
  end
end


