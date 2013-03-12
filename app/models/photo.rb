class Photo < ActiveRecord::Base
   attr_accessible :user_id, :image
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
   belongs_to :user
end
