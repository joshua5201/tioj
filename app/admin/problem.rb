ActiveAdmin.register Problem do
  permit_params :name, :description, :source, :input, :output, :example_input, :example_output, :hint, :visible_state, 
      :problem_type, :sjcode, :interlib
  
  preserve_default_filters!
  filter :id
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
