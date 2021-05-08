class Can < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :active
  belongs_to_active_hash :place
  belongs_to_active_hash :set_time

  with_options numericality: { other_than: 0 } do
    validates :active_id
    validates :place_id
    validates :set_time_id
  end

  validates :image, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定
  has_many :likes, dependent: :destroy
  has_one_attached :image

end
