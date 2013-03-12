ActiveAdmin.register User do
   form :html => { :enctype => "multipart/form-data" } do |f| 
     f.inputs "Details" do
       f.input :name
       f.input :email
     end 
   f.actions
   end 
end
