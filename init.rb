config.autoload_paths += %W(#{TypoGallery::PLUGIN_CONTROLLER_PATH}  \
                            #{TypoGallery::PLUGIN_HELPER_PATH}      \
                            #{TypoGallery::PLUGIN_VIEWS_PATH}       \
                            #{TypoGallery::PLUGIN_MODELS_PATH}      \
                            #{TypoGallery::PLUGIN_ADMIN_HELPER_PATH})

ActionView::Base.send(:include, TypoGallery::Helper)

# require the controller
require 'typo_gallery_controller'
