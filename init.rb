config.autoload_paths += %W(#{TypoGallery::PLUGIN_CONTROLLER_PATH}  \
                            #{TypoGallery::PLUGIN_HELPER_PATH}      \
                            #{TypoGallery::PLUGIN_VIEWS_PATH}       \
                            #{TypoGallery::PLUGIN_MODELS_PATH}      \
                            #{TypoGallery::PLUGIN_ADMIN_HELPER_PATH})

ActionView::Base.send(:include, TypoGallery::Helper)

unless ::TypoAlbum.table_exists?
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
  
unless ::TypoAlbumsTypoImages.table_exists?
  ActiveRecord::Schema.create_table(TypoAlbumsTypoImages.table_name) do |t|
    t.column :typo_album_id,  :integer
    t.column :typo_image_id,  :integer
  end
end

unless ::TypoImage.table_exists?
  ActiveRecord::Schema.create_table(TypoImage.table_name) do |t|
    t.column :title,        :string
    t.column :description,  :text
    t.column :resource_id,  :integer
  end
end

  
AccessControl.map :require => [ :admin, :publisher, :contributor ]  do |map|
  map.project_module :typogallery, nil do |project|
    project.menu    "Gallery",  { :controller => "admin/typo_album" }
#      project.submenu "Albums", {:controller => "admin/typo_album" }
  end
end

# require the controller
require 'typo_gallery_controller'

