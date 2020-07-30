class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shippings
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :phone_number, presence: true

  # acts_as_paranoid

  enum is_deleted: { '退会済': true, '会員': false}

  def active_for_authentication?
  	super && (self.is_deleted == '会員')
  end
  def fullname
    self.last_name + self.first_name
  end

end
