class Product < ActiveRecord::Base
  attr_accessible :area, :fingerptint, :name, :variety, :year
  belongs_to :vineyard
  has_many :posts

  def average_score
    @suma = 0
	self.posts.each do |p|
		@suma += p.score
	end
 	return (@suma/self.posts.count.to_f).round(2)
  end
end
