# frozen_string_literal: true

class LinePayApi
  def initialize(signature_uri)
    @signature_uri = signature_uri
  end

  def nonce
    uuid = SecureRandom.uuid
    now = Time.now.to_s

    nonce = uuid + now
  end

  def req_body(room, booking)
    name = "#{room.address} #{Room.human_enum_name(:home_type, room.home_type)}"
    quantity = (booking.end_at - booking.start_at).to_i
    price = room.price.to_i
    amount = quantity * price

    @req_body = {
      amount:,
      currency: 'TWD',
      orderId: "ORDER#{Time.now.to_date.strftime('%Y%m%d')}#{booking.id.to_s.rjust(4, '0')}",
      packages: [{
        id: room.id.to_s,
        amount:,
        products: [
          {
            name:,
            quantity:,
            price:
          }
        ]
      }],
      redirectUrls: {
        confirmUrl: "https://roomit.gg/bookings/#{booking.serial}/confirm",
        cancelUrl: "https://roomit.gg/bookings/#{booking.serial}/cancel"
      }
    }
  end

  def confirm_body(booking)
    quantity = (booking.end_at - booking.start_at).to_i
    price = booking.room.price.to_i
    amount = quantity * price

    @confirm_body = {
      amount:,
      currency: 'TWD'
    }
  end

  def header(nonce, signature)
    header = {
      "Content-Type": 'application/json',
      "X-LINE-ChannelId": ENV['LINE_CHANNEL_ID'],
      "X-LINE-Authorization-Nonce": nonce,
      "X-LINE-Authorization": signature
    }
  end

  def get_signature(signature_uri = @signature_uri, nonce, req_body)
    message = "#{ENV['LINE_CHANNEL_SECRET']}#{signature_uri}#{req_body.to_json}#{nonce}"
    hash = OpenSSL::HMAC.digest('SHA256', ENV['LINE_CHANNEL_SECRET'], message)
    Base64.strict_encode64(hash)
  end

  def get_response(signature_uri = @signature_uri, header, body)
    uri = URI.parse("https://sandbox-api-pay.line.me#{signature_uri}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = body.to_json

    response = http.request(request)
  end
end
