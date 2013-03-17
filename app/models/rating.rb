class Rating < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :score
end
