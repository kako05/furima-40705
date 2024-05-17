class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password,
            format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]+\z/,
                      message: 'is invalid. Please input a combination of half-width alphanumeric characters.' }
  with_options presence: true do
    validates :nickname, :birthday
    validates :family_name, :first_name,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :family_reading, :first_reading,
              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end
