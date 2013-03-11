class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :comments
  attr_accessible :content, :score, :sponsored
end
