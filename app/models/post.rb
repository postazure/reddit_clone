class Post < ActiveRecord::Base
  belongs_to :User
  has_many :comments
end
