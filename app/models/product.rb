class Product < ActiveRecord::Base
  attr_accessible :area, :fingerptint, :name, :variety, :year
  belongs_to :vineyard
end
