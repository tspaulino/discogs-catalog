require 'net/http'

module Discogs
    class Client
        DISCOGS_API_BASE_URL="https://api.discogs.com"

        def self.fetch_album(barcode="")
            album_url = URI.parse("#{DISCOGS_API_BASE_URL}/database/search?barcode=#{barcode}&token=#{Rails.application.credentials.dig(:discogs, :access_token)}")

            response = Net::HTTP.get_response(album_url)
            data = response.body

            puts data
        end
    end
end