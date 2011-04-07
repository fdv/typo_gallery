class TypoGalleryController < ActionController::Base
  unloadable
  layout :theme_layout
  before_filter :template_root
  
  def template_root
    self.class.view_paths = ::ActionController::Base.view_paths.dup.unshift(TypoGallery::PLUGIN_VIEWS_PATH)
  end
  
  def theme_layout
    File.join("#{::Rails.root.to_s}/themes/#{Blog.default.theme}/views", Blog.default.current_theme.layout(self.action_name))
  end
  
  
  def index
    @resources = Resource.paginate :page => params[:page], :conditions => [ "mime in ('image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png')"], :order => 'created_at DESC', :per_page => 10
  end
  
  def show
    @image = Resource.find(params[:id])
  end
end