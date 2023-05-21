class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。'}, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。'}, presence: true
  validates :last_name_kana,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナで入力して下さい。'}, presence: true
  validates :first_name_kana,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナで入力して下さい。'}, presence: true
  validates :birthday, presence: true      
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,format: { with:VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}, presence: true

  has_many :items
  has_many :histories
end
