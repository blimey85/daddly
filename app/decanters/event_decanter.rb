class EventDecanter < Decanter::Base
  ignore :waitlist, :status, :type, :visibility, :venue_id

  input :name, :string
  input :description, :string
  input :rsvp_min_limit, :integer
  input :rsvp_max_limit, :integer

  input [:start_date, :start_time], :squash_date_time, key: :starts_at
  input [:end_date, :end_time], :squash_date_time, key: :ends_at
end
