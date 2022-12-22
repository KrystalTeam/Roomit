# frozen_string_literal: true

class GoogGeocodingApi
  def initialize(address)
    @address = address
  end

  def get_response
    key = ENV['GOOG_MAPS_API_KEY']
    uri = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=#{key}"

    response = HTTP.post(uri)
    response.parse['results'][0]['geometry']['location']
  end

  def get_lat(coordinates)
    coordinates['lat']
  end

  def get_lng(coordinates)
    coordinates['lng']
  end
end
