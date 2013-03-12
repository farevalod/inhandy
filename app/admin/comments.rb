ActiveAdmin.register Comment, :as => "PostComment" do
   form :html => { :enctype => "multipart/form-data" } do |f| 
     f.inputs "Details" do
       f.input :user_id, :as => :select, :collection => Hash[User.all.map{|u| [u.name, u.id]}]
       f.input :content
     end 
   f.actions
   end 
end
