class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :name, :password_confirmation, :remember_me, :bio
  # attr_accessible :title, :body
end
