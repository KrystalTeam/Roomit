class GoogPlacesApi
  def initialize(location)
    @location = location
    @key = ENV['GOOG_MAPS_API_KEY']
  end

  def get_tourist_attractions
    radius = '2000'
    type = 'tourist_attraction'

    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@location}2&radius=#{radius}&type=#{type}&key=#{@key}&language=zh-TW")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    result = []
    arr_length = JSON.parse(response.read_body)['results'].length

    if arr_length > 0
      if arr_length > 8
        for i in 0..7 do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      else
        for i in 0..(arr_length - 1) do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      end
    end

    result
  end

  def get_restaurants
    radius = '2000'
    type = 'restaurant'

    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@location}2&radius=#{radius}&type=#{type}&key=#{@key}&language=zh-TW")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    result = []
    arr_length = JSON.parse(response.read_body)['results'].length

    if arr_length > 0
      if arr_length > 10
        for i in 0..9 do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      else
        for i in 0..(arr_length - 1) do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      end
    end

    result
  end

  def get_convenience_stores
    radius = '1000'
    type = 'convenience_store'

    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@location}2&radius=#{radius}&type=#{type}&key=#{@key}&language=zh-TW")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    result = []
    arr_length = JSON.parse(response.read_body)['results'].length

    if arr_length > 0
      if arr_length > 10
        for i in 0..9 do
          ele = JSON.parse(response.read_body)['results'][i]['name'].sub('7-ELEVEn', '7-ELEVEN')
          result << ele if ele.length > 6
        end
      else
        for i in 0..(arr_length - 1) do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele if ele.length > 6
        end
      end
    end

    result
  end

  def get_bars
    radius = '1200'
    type = 'bar'

    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@location}2&radius=#{radius}&type=#{type}&keyword=#{type}&key=#{@key}&language=zh-TW")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    result = []
    arr_length = JSON.parse(response.read_body)['results'].length

    if arr_length > 0
      if arr_length > 5
        for i in 0..4 do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      else
        for i in 0..(arr_length - 1) do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      end
    end

    result
  end

  def get_hospitals
    radius = '10000'
    type = 'hospital'

    url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@location}2&radius=#{radius}&type=#{type}&keyword=#{type}&key=#{@key}&language=zh-TW")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    result = []
    arr_length = JSON.parse(response.read_body)['results'].length

    if arr_length > 0
      if arr_length > 3
        for i in 0..2 do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      else
        for i in 0..(arr_length - 1) do
          ele = JSON.parse(response.read_body)['results'][i]['name']
          result << ele
        end
      end
    end

    result
  end
end