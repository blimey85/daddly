class SquashDateTimeParser < Decanter::Parser::ValueParser
  parser do |value|
    date, time = value.map(&:to_s)
    datetime = date + ' ' + time
    datetime.to_datetime
  end
end
