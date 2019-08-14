class User < ApplicationRecord
  has_many :tokens
  has_secure_password
  validates :name, :email, :sex, {presence: true}
end
