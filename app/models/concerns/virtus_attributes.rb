module VirtusAttributes
  include Virtus.model(constructor: false, mass_assignment: false)
  attribute :user_has_upvoted, Boolean, default: false, lazy: true
  attribute :created_by_current_user, Boolean, default: false, lazy: true
end
