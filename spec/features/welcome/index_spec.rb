require 'rails_helper'

RSpec.describe 'welcome index' do
  it 'has a select field to select a nation' do
    visit root_path

    expect(page).to have_select(:nation,  options: ['Air Nomads', 'Earth Kingdom', 'Fire Nation', 'Water Tribes'])

    click_button('Search For Members')

    expect(current_path).to eq(search_path)
  end
end
