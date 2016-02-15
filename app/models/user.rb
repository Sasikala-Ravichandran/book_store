class User < ActiveRecord::Base

  has_secure_password 

  VALID_FORMAT =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: VALID_FORMAT}

  has_many :addresses
  has_many :orders
  accepts_nested_attributes_for :addresses

  def full_name
    "#{first_name} #{last_name}"
  end
end
