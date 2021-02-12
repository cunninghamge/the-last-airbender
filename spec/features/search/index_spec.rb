require 'rails_helper'

RSpec.describe 'search index' do
  it 'searches for members by nation' do
    visit root_path
    select('Fire Nation', from: :nation)
    click_button('Search For Members')

    expect(page).to have_content("Total Members: 97")
  end
end
