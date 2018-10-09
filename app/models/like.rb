class Like < ApplicationRecord
  belongs_to :user
  belongs_to :space, counter_cache: true
end
