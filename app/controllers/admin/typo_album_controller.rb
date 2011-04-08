module Admin; end

class Admin::TypoAlbumController < Admin::BaseController
  layout 'administration'
  unloadable
  
  def index
    @albums = TypoAlbum.find(:all)
  end
    
  def new; new_or_edit ; end
  def edit; new_or_edit;  end
  
  def new_or_edit
    @album = case params[:id]
    when nil
      TypoAlbum.new
    else
      TypoAlbum.find(params[:id])
    end
    @album.attributes = params[:album]
    if request.post?
      if @album.save!
        flash[:notice] = _('Album was successfully saved.')
      else
        flash[:error] = _('Album could not be saved.')
      end
        redirect_to :action => 'index'
      return
    end
    render :action => 'new'
  end
end