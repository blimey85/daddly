module VirtusAttributes
  include Virtus.model(constructor: false, mass_assignment:  false)
  attribute :user_has_upvoted, Boolean, default: false, lazy: true
  attribute :created_by_current_user, Boolean, default: false, lazy: true

  def attributes
    super.merge(user_has_upvoted: user_has_upvoted, created_by_current_user: created_by_current_user)
  end
end
