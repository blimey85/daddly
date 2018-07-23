# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = [:expect, :should]
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.order = :rand
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

# Setuo Oauth for testing
OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  info: {
    id: 6,
    user_id: 2,
    provider: 'facebook',
    accesstoken: 'EAAEDlzPZAwpABANjP1dJSy85a1hSCWy3h6ulGyYZCpzUBSx65WYrAJogbQUUXFhVTmZBvEfYwgAE7CkcYDClPqsBJZC34c57kk0NwJEt1Qg7HoKHxaKDXDKc0wKJnxkCD27879Hxjbfn2wEzcyDYAhxsNyNr6sAZD',
    uid: '1436344229',
    name: 'Gary Traffanstedt',
    email: 'facebook@gmail.com',
    image: 'http://graph.facebook.com/v2.6/1436344229/picture'
  },
  credentials: {
    expires_at: ''
  }
)

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
  info: {
    id: 11,
    provider: 'google_oauth2',
    accesstoken: 'ya29.GlugBKtAxJVCZxRuXnNIMLOLUChQfHjQaNji1l7VL3gyjqzV2kIEV1bCGo3wRDJbt8Cj6Ou1CH0LviULVyxwfDOD7X3nGs4tlZCumWAFBM3TP-RX2ef6aEt9Z0uT',
    uid: '110614351506927413293',
    name: 'Gary Traffanstedt',
    email: 'google@gmail.com',
    image: 'https://lh6.googleusercontent.com/-lUlB-235F30/AAAAAAAAAAI/AAAAAAAABgs/EqyGW40oVa8/photo.jpg',
    refreshtoken: '1/YCd5Uj69ODtdU56lVhlOpPvhD3aJcwR0O_IcRWwfw78'
  },
  credentials: {
    expires_at: ''
  }
)


OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  info: {
    id: 10,
    provider: 'twitter',
    accesstoken: '16269312-SQ5y8YjcpsQ7UNKlLrp7kZH5NJb2Ou0XziAhKQl1I',
    uid: '16269312',
    name: 'Gary',
    email: 'twitter@gmail.com',
    nickname: 'blimey85',
    image: 'http://pbs.twimg.com/profile_images/783463225983660032/cmt2_4mL_normal.jpg',
    urls: "{\"Website\":null,\"Twitter\":\"https://twitter.com/blimey85\"}"
  },
  credentials: {
    expires_at: ''
  }
)
