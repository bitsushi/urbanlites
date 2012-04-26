class DownloadsController < ApplicationController

  def index
    @downloads = Download.all
  end

  def show
    @download = Download.find(params[:id])
  end

end
