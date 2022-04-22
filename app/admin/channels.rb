ActiveAdmin.register Channel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :tagline, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :tagline, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  scope :all, :default => true
  # scope :active_products do |products|
  #   products.where(:status => false)
  # end
  # scope :inactive_products do |products|
  #   products.where(:status => true)
  # end
  
  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    
    f.inputs do
      f.input :name
      f.input :tagline
      f.input :image , :as => :file 
      #f.input :description, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left: 20%" } 
    end
    f.actions
  end
  
end
