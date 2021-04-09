class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :user_judges
  

  validates :nickname,           presence: true
  # validates :email,              presence: true, uniqueness: true
  validates :password,           presence: true, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :encrypted_password, presence: true
  validates :family_name,        presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :family_kana_name,   presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}
  validates :last_kana_name,     presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください'}
  validates :birth,              presence: true
end
