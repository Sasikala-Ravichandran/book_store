require 'rails_helper'

RSpec.describe User, :type => :model do
  
  it "requires first name" do
    user = User.new(first_name: " ", last_name: "Doe", 
                    email: "john@example.com", password: "password")
    expect(user).not_to be_valid
    expect(user.errors[:first_name].any?).to be_truthy
  end

  it "requires last name" do
    user = User.new(first_name: "John", last_name: nil, 
                    email: "john@example.com", password: "password")
    expect(user).not_to be_valid
    expect(user.errors[:last_name].any?).to be_truthy
  end

  it "requires email" do
    user = User.new(first_name: "John", last_name: "Doe", 
                    email: " ", password: "password")
    expect(user).not_to be_valid
    expect(user.errors[:email].any?).to be_truthy
  end

  it "requires password" do
    user = User.new(first_name: "John", last_name: "Doe", 
                    email: "john@example.com", password: nil)
    expect(user).not_to be_valid
    expect(user.errors[:password].any?).to be_truthy
  end 

  describe "#full_name" do
    it "requires a #full_name" do
      user = User.new(first_name: "John", last_name: "Doe", 
                    email: "john@example.com", password: "password")
      expect(user.full_name).to eq("John Doe")
    end
  end

end