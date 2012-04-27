class Admin::PhotosController < Admin::BaseController

  def sort
    params[:photo].each_with_index do |id, index|
      Photo.update_all({ordinal: index+1}, {id: id})
    end
    render nothing: true
  end

  def index
    @photos = Photo.all
    render :json => @photos.collect { |p| p.to_jq_upload }.to_json
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      redirect_to "#{edit_admin_project_path(@photo.project)}#photos", notice: 'Photo was successfully updated.'
    else
      render action: "edit"
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html {
        redirect_to "#{edit_admin_project_path(@photo.project)}#photos"
      }
      format.json {
        render :json => true
      }
    end
    #
  end

end
