class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  has_many :cans, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定
  has_many :comments, dependent: :destroy   #外部キーを持つデータのdestroyを行うための設定

end
