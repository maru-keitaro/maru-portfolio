class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cans, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定
  has_many :comments, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定

  validates :nickname, presence: true, length: { maximum: 6 }
end
