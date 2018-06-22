# frozen_string_literal: true

require 'rails_helper'

# Test all factories
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      build_stubbed(factory_name).should be_valid
    end
  end
end

# Test all fixtures
describe 'The user fixture' do
  include_context 'user'
  it 'is valid' do
    # user.should be_valid
  end
end

describe 'The venue fixture' do
  include_context 'venue'
  it 'is valid' do
    # venue.should be_valid
  end
end
