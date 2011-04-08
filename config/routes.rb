ActionController::Routing::Routes.draw do |map|
  map.connect 'gallery/page/:id', :controller => 'typo_gallery', :action => 'index'
  map.connect 'gallery/:action/:id', :controller => 'typo_gallery'
  
  %w{typo_album typo_image }.each do |i|
    map.connect "/admin/#{i}", :controller => "admin/#{i}", :action => 'index'
    map.connect "/admin/#{i}/:action/:id", :controller => "admin/#{i}", :action => nil, :id => nil
  end
end