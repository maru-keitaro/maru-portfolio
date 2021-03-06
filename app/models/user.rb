class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cans, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定
  has_many :comments, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'user_id'
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'target_user_id'
  has_many :followings, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  
  validates :nickname, presence: true, length: { maximum: 6 }

  def already_liked?(can)
    self.likes.exists?(can_id: can.id)
  end

  
end
