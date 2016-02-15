class User < ActiveRecord::Base

  before_create :generate_token

  has_secure_password 

  VALID_FORMAT =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: VALID_FORMAT}

  has_many :addresses
  has_many :orders
  accepts_nested_attributes_for :addresses

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_param
    token
  end

  protected
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

end
