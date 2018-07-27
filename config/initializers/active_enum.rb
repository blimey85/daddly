# Form helper integration
require 'active_enum/form_helpers/simple_form' # for SimpleForm

ActiveEnum.setup do |config|
  # Extend classes to add enumerate method
  # config.extend_classes = [ ActiveRecord::Base ]

  # Return name string as value for attribute method
  # config.use_name_as_value = true

  # Raise exception ActiveEnum::NotFound if enum value for a given id or name is not found
  config.raise_on_not_found = false

  # Storage of values (:memory, :i18n)
  # config.storage = :memory
end

# class Gender < ActiveEnum::Base
#   value id: 0, name: 'Not Saying'
#   value id: 1, name: 'Male'
#   value id: 2, name: 'Female'
# end
