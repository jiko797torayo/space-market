class PurposeValidationValidator < ActiveModel::Validator
  def validate(record)
    items = [record.party, record.meeting, record.photo_shoot, record.film_shoot, record.event,
      record.performance, record.studio, record.sports, record.office, record.wedding, record.other]
    
    unless items.any? {|item| item == 1}
      record.errors[:base] << "使用可能用途を入力してください。"
    end
  end
end
