class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :comments
  attr_accessible :content, :score, :sponsored

  def word_score
	@rating = Rating.where("user_id = ?",self.user.id).where("score = ?",self.score).first.name
	  return @rating
  end
end
