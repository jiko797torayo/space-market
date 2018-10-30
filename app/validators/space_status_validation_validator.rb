class SpaceStatusValidationValidator < ActiveModel::Validator
  def validate(record)
    items = [record.equipment_info, record.basic_info, record.description, record.space_image, record.plan]

    unless items.all? {|item| item.present? }
      record.errors[:status] << "未入力の情報があります"
    end
  end
end
