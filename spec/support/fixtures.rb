RSpec.shared_context 'user', user: true do
  before(:all) do
    @user = TestProf::AnyFixture.register(:user) do
      FactoryBot.create(:user, first_name: 'Josh', last_name: 'Steiner')
    end
  end

  let(:user) { @user }
end

RSpec.shared_context 'venue', venue: true do
  before(:all) do
    @venue = TestProf::AnyFixture.register(:venue) do
      FactoryBot.create(:venue, address: '1905 Cedar Street', city: 'Calistoga', state: 'CA', zipcode: '94515')
    end
  end

  let(:venue) { @venue }
end
