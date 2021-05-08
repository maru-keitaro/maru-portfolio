class Like < ApplicationRecord

  belongs_to :user
  belongs_to :can

  validates_uniqueness_of :can_id, scope: :user_id
end
