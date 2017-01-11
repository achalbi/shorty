class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :token, :email

  has_many :short_urls 
end
