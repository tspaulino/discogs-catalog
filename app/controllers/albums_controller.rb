class AlbumsController < ApplicationController
  def index
  end


  def search
    @albums = Discogs::Client.fetch_album(params[:q])['results']
    render "index"
  end
end
