config.autoload_paths += %W(#{TypoGallery::PLUGIN_CONTROLLER_PATH}, #{TypoGallery::PLUGIN_HELPER_PATH} #{TypoGallery::PLUGIN_VIEWS_PATH})

# require the controller
require 'typo_gallery_controller'
