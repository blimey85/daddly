if Rails.env.test?
  Geocoder.configure(lookup: :test)
  # Particular Look up
  Geocoder::Lookup::Test.add_stub(
      "1905 Cedar Street, Calistoga, CA 94515", [
      {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'address'      => '1905 Cedar Street',
          'city'        => 'Calistoga',
          'state'        => 'California',
          'state_code'   => 'CA'
      }]
  )
  # default stub
  # default must return blank for validations to work properly
  Geocoder::Lookup::Test.set_default_stub(
      [
          {
              'latitude'     => '',
              'longitude'    => ''
          }
      ]
  )
else
  Geocoder.configure(
      lookup: :google, # name of geocoding service (symbol)
      use_https: false, # use HTTPS for lookup requests? (if supported)
      api_key: 'AIzaSyBoleHycUrcFJNpJ8sh2BR_in5aAifXNsE', # API key for geocoding service
      cache: Redis.new
  )
end
