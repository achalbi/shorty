# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

    it "is valid with a name, email, token and password" do
    	expect(build(:user)).to be_valid
    end

    it "is invalid without a name" do
    	user = build(:user, name: nil)
    	user.valid?
		expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a email" do
    	user = build(:user, email: nil)
    	user.valid?
		expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
    	user = build(:user, password: nil)
    	user.valid?
		expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation" do
    	user = build(:user, password_confirmation: nil)
    	user.valid?
		expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "is invalid with password not equal to password_confirmation"  do
      	user = build(:user, password: "abcd", password_confirmation: "1234")
    	user.valid?
		expect(user.errors[:password_confirmation]).to include("doesn't match Password")
	end
	it "is valid email format" do
		user = build(:user, email: "achal.rvce@gmail.com")
    	user.valid?
		expect(user).to be_valid
	end

	it "is invalid email format" do
		user = build(:user, email: "abc")
    	user.valid?
		expect(user.errors[:email]).to include("is invalid")
		user = build(:user, email: "abc@111")
    	user.valid?
		expect(user.errors[:email]).to include("is invalid")
		user = build(:user, email: "abc.asdsa")
    	user.valid?
		expect(user.errors[:email]).to include("is invalid")
		user = build(:user, email: "abc.adas.asd@123")
    	user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

    it "is invalid with a duplicate email address" do
    	create(:user, email: "achal.rvce@gmail.com")
    	user = build(:user, email: "achal.rvce@gmail.com")
    	user.valid?
		expect(user.errors[:email]).to include("has already been taken")
	end

    it "is invalid with a duplicate token address" do
    	create(:user)
    	user = build(:user)
    	user.valid?
		expect(user.errors[:token]).to include("has already been taken")
	end

end
