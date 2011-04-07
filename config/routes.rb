ActionController::Routing::Routes.draw do |map|
  map.connect 'gallery/page/:id', :controller => 'typo_gallery', :action => 'index'
  map.connect 'gallery/:action/:id', :controller => 'typo_gallery'
end