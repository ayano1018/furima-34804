class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :products, dependent: :destroy
  # has_many :order_histories, dependent: :destroy

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
 with_options presence: true do
  validates :nickname, length:  { maximum: 40}
  validates :email, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です' }
  validates :Password, presence: true, format: { with:  VALID_PASSWORD_VALIDATION, message: 'は英字と数字の両方を含めて設定してください' }
 end
with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
  end
with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "カタカナを使用してください"}do
  validates :last_name_kana
  validates :first_name_kana 
  end
  validates :birth, presence: true
end
