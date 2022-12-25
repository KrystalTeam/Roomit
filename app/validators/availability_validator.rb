class AvailabilityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bookings = Booking.where(["room_id =?", record.room_id])
    date_ranges = bookings.map { |b| b.start_at..b.end_at.yesterday }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
        # flash[:alert] =  "在此日期本房間已被預定，請選擇其他日期"
      end
    end
  end
end