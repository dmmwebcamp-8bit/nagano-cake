class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

  # バリデーション
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :address

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。'} do
      validates :first_name_kana
      validates :last_name_kana
    end

    with_options numericality: {only_integer: true} do
      validates :phone_number
      validates :postal_code, length: { is: 7, message: 'は7桁で入力して下さい。' }
    end
  end

  def full_name
    last_name + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end

  def full_address
    '〒' + postal_code + ' ' + address
  end

end
