class Address < ActiveRecord::Base
  belongs_to :user

  validates :address_line1, :address_line2, :city, :zipcode, presence: true
end
