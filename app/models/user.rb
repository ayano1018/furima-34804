class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :nickname, presence: true, :length => { :maximum => 40}
  validates :email,:presence true, :format => { :with => VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です' }
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128},    format: { with: PASSWORD_VALIDATION, 'は英字と数字両方を含むパスワードを設定してください' }
  validates :last_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length: { maximum: 35 }
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :birth_yyyy_id, presence: true
  validates :birth_mm_id, presence: true
  validates :birth_dd_id, presence: true
end
