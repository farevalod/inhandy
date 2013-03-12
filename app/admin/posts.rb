ActiveAdmin.register Post do
   form :html => { :enctype => "multipart/form-data" } do |f| 
     f.inputs "Details" do
       f.input :content
       f.input :user_id, :as => :select, :collection => Hash[User.all.map{|u| [u.name, u.id]}]
     end 
   f.actions
   end 
end
