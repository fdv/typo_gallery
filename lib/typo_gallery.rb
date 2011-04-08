module TypoGallery
  PLUGIN_NAME = 'typo_gallery'
  PLUGIN_PATH = "#{::Rails.root.to_s}/vendor/plugins/#{PLUGIN_NAME}"
  PLUGIN_CONTROLLER_PATH = "#{PLUGIN_PATH}/app/controllers"
  PLUGIN_VIEWS_PATH = "#{PLUGIN_PATH}/app/views"
  PLUGIN_HELPER_PATH = "#{PLUGIN_PATH}/app/helpers"
  PLUGIN_ADMIN_HELPER_PATH = "#{PLUGIN_PATH}/app/helpers/admin"
  PLUGIN_MODELS_PATH = "#{PLUGIN_PATH}/app/models" 
  
  unless ::TypoAlbums.table_exists?
    ActiveRecord::Schema.create_table(TypoAlbums.table_name) do |t|
      t.column :title,          :string
      t.column :description,    :text
      t.column :status,         :integer
    end
    
    admin = Profile.find_by_label('admin')
    admin.modules << :typogallery
    admin.save
    
    publisher = Profile.find_by_label('publisher')
    publisher.modules << :typogallery
    publisher.save
    
  end
  
  AccessControl.map :require => [ :admin, :publisher, :contributor ]  do |map|
    map.project_module :typogallery, nil do |project|
      project.menu    "Gallery",  { :controller => "admin/typo_album" }
#      project.submenu "Albums", {:controller => "admin/typo_album" }
    end
  end
  
  module Helper
    def class_typogallery
      
    end
  end
  
end