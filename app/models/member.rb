class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shippings

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # acts_as_paranoid

  enum is_deleted: { '退会済': true, '会員': false}

  def active_for_authentication?
  	super && (self.is_deleted == '会員')
  end
  def fullname
    self.last_name + self.first_name
  end
end
