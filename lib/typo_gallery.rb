module TypoGallery
  PLUGIN_NAME = 'typo_gallery'
  PLUGIN_PATH = "#{::Rails.root.to_s}/vendor/plugins/#{PLUGIN_NAME}"
  PLUGIN_CONTROLLER_PATH = "#{PLUGIN_PATH}/app/controllers"
  PLUGIN_VIEWS_PATH = "#{PLUGIN_PATH}/app/views"
  PLUGIN_HELPER_PATH = "#{PLUGIN_PATH}/app/helpers"
  PLUGIN_ADMIN_HELPER_PATH = "#{PLUGIN_PATH}/app/helpers/admin"
  PLUGIN_MODELS_PATH = "#{PLUGIN_PATH}/app/models" 
  
  
  module Helper
    def class_typogallery
      
    end
  end
  
end