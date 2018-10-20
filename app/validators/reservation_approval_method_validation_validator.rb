class ReservationApprovalMethodValidationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add(attribute, '予約の承認方式を入力してください。')
    end
  end
end
