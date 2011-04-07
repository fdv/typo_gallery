# Include hook code here

ActionController::Routing::Routes.draw do |map|
  map.connect 'gallery', :controller => 'typo_gallery', :action => 'index'
end

#sentinel = /\.routes\.draw do(?:\s*\|map\|)?\s*$/

#FileUtils.cd(root) do 
#  inject_into_file 'config/routes.rb', "\n map.connect 'gallery/:action', :controller => 'typo_gallery' \n", { :after => sentinel, :verbose => false }
#end

config.autoload_paths += %W(#{TypoGallery::PLUGIN_CONTROLLER_PATH} #{TypoGallery::PLUGIN_HELPER_PATH}, #{TypoGallery::PLUGIN_VIEWS_PATH})

# require the controller
require 'typo_gallery_controller'
