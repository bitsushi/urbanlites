class Admin::DownloadsController < Admin::BaseController
  # GET /downloads
  # GET /downloads.json
  def index
    @downloads = Download.all
  end

  # GET /downloads/new
  # GET /downloads/new.json
  def new
    @download = Download.new
  end

  # GET /downloads/1/edit
  def edit
    @download = Download.find(params[:id])
  end

  # POST /downloads
  # POST /downloads.json
  def create
    @download = Download.new(params[:download])
    if @download.save
      redirect_to admin_downloads_url, notice: 'Download was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /downloads/1
  # PUT /downloads/1.json
  def update
    @download = Download.find(params[:id])

    respond_to do |format|
      if @download.update_attributes(params[:download])
        format.html { redirect_to admin_downloads_url, notice: 'Download was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /downloads/1
  # DELETE /downloads/1.json
  def destroy
    @download = Download.find(params[:id])
    @download.destroy

    respond_to do |format|
      format.html { redirect_to admin_downloads_url }
    end
  end
end
