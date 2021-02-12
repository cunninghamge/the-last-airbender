require 'rails_helper'

RSpec.describe SearchFacade do
  it 'gets members' do
    members = SearchFacade.find_members('fire_nation')

    expect(members.size).to eq(25)
    expect(members).to be_a(Array)
    expect(members[0]).to be_a(Member)
  end
end
