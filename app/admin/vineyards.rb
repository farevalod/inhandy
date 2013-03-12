ActiveAdmin.register Vineyard do
   form :html => { :enctype => "multipart/form-data" } do |f| 
     f.inputs "Details" do
       f.input :name
     end 
   f.actions
   end 
end
