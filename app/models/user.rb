class User < ActiveRecord::Base
  has_many :comments
  has_many :posts


  validates :username, :email, presence: true, uniqueness: true

  has_secure_password
end
