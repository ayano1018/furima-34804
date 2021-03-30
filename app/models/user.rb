class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :products, dependent: :destroy
  # has_many :order_histories, dependent: :destroy

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_VALIDATION = /\A[\w\-]+\z/
  validates :nickname, presence: true, :length => { :maximum => 40}
  validates :email, presence: true, :format => { :with => VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です' }
  validates :password_confirmation, presence: true, :format => { :with => VALID_PASSWORD_VALIDATION, message: 'は英字と数字の両方を含めて設定してください' }
  validates :last_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name_kana, presence: true, length: { maximum: 35 }
  validates :first_name_kana, presence: true, length: { maximum: 35 }
  validates :birth, presence: true
 
end
