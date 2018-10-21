class AboutFacilitiesValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '設備・サービスについて10文字以上800文字以内で入力してください')
    elsif value.length < 10
      record.errors.add(attribute, '設備・サービスについて10文字以上入力してください')
    elsif value.length > 800
      record.errors.add(attribute, '設備・サービスについて800文字以内で入力してください')
    end
  end
end
