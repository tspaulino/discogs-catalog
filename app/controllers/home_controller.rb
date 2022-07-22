class HomeController < ApplicationController
  def index
    @albums = Discogs::Client.latest_releases['results']
  end
end
