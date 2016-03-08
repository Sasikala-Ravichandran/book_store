class Author < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :publications, dependent: :destroy
  has_many :books, through: :publications
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
