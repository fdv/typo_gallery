class TypoAlbumController < ActionController::Base 
  unloadable
  
  def index
    @albums = TypoAlbum.find(:all, :order => 'title desc')
  end
  
  def show
    @album = Album.find_by_permalink(params[:permalink])
  end
  
end