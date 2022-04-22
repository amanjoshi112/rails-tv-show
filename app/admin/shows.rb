ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :image, :time, :channel_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :image, :time, :channel_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  scope :all, :default => true
  scope :sony_sab do |shows|
    shows.where(:channel_id => "2")
  end
  scope :star_plus do |shows|
    shows.where(:channel_id => "1")
  end
  
  form do |f|
    text_node javascript_include_tag Ckeditor.cdn_url
    
    f.inputs do
      f.input :channel  
      f.input :name
      f.input :time, :as => :time_picker, :format=>"%H:%M" 
      f.input :image , :as => :file 
      #f.input :description, :as => :ckeditor, input_html: { ckeditor: { height: 200 }, style: "margin-left: 20%" } 
    end
    f.actions
  end

end
