# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = [:expect, :should]
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :rand
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

# Share mail deliveries between threads.
module Mail
  class TestMailer
    mattr_accessor :shared_deliveries

    def self.deliveries
      @@shared_deliveries || []
    end
  end
end
Mail::TestMailer.shared_deliveries = Mail::TestMailer.deliveries
