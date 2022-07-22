require 'net/http'

module Discogs
    class Client
        DISCOGS_API_BASE_URL="https://api.discogs.com"

        def self.fetch_album(barcode="")
            # TODO: extract request to a private method
            album_url = URI.parse("#{DISCOGS_API_BASE_URL}/database/search")
            album_url.query = URI.encode_www_form(barcode: barcode) unless barcode.empty?

            req = Net::HTTP::Get.new(album_url)
            req['Authorization'] = "Discogs token=#{Rails.application.credentials.dig(:discogs, :access_token)}"

            res = Net::HTTP.start(album_url.hostname, album_url.port, :use_ssl => album_url.scheme == 'https') do |http|
                http.request(req)
            end

            data = res.body

            JSON.parse(data)
        end

        def self.latest_releases
            album_url = URI.parse("#{DISCOGS_API_BASE_URL}/database/search")
            album_url.query = URI.encode_www_form(year: Time.now.year, sort_order: 'desc')

            req = Net::HTTP::Get.new(album_url)
            req['Authorization'] = "Discogs token=#{Rails.application.credentials.dig(:discogs, :access_token)}"

            res = Net::HTTP.start(album_url.hostname, album_url.port, :use_ssl => album_url.scheme == 'https') do |http|
                http.request(req)
            end

            data = res.body

            JSON.parse(data)
        end

        # TODO: Refactor class to a singleton pattern
        # private
        #     def self.perform_query(params: {})
        #         album_url = URI.parse("#{DISCOGS_API_BASE_URL}/database/search")
        #         puts params
        #         album.query = URI.encode_www_form(params) unless params.empty?

        #         req = Net::HTTP::Get.new(uri)
        #         req['Authorization'] = "Discogs token=#{Rails.application.credentials.dig(:discogs, :access_token)}"

        #         res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        #             http.request(req)
        #         end

        #         data = res.body

        #         data
        #     end
    end
end