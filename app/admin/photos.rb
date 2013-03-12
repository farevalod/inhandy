ActiveAdmin.register Photo do
   form :html => { :enctype => "multipart/form-data" } do |f| 
     f.inputs "image" do
       f.input :user_id, :as => :select, :collection => Hash[User.all.map{|u| [u.name, u.id]}]
       f.input :image, :as => :file
     end 
     f.buttons
   end 
   show :title => "Detalles foto" do |v| 
     attributes_table do
       row :user_id do |v| 
         link_to v.user.name, admin_user_path(v.user.id)
       end 
       row :image do |v| 
         link_to image_tag(v.image(:medium)), admin_photo_path(v.image)
       end 
     end 
  end 
end
