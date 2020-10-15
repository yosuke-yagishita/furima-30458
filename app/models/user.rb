class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true

  KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options presence: true, format: { with: KANJI_REGEX, message: 'Full-width characters' } do
    validates :family_name_kanji
    validates :first_name_kanji
  end

  KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  with_options presence: true, format: { with: KANA_REGEX, message: 'Full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :birth, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
