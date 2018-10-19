class Purpose < ApplicationRecord
  belongs_to :basic_info

  validates_with PurposeValidationValidator
end
