require 'rails_helper'

RSpec.describe 'search index' do
  it 'searches for members by nation' do
    data = File.read('spec/fixtures/fire_nation.json')
    member_data = JSON.parse(data, symbolize_names: true)
    members = member_data.map do |member_hash|
      Member.new(member_hash)
    end

    visit root_path
    select('Fire Nation', from: :nation)
    click_button('Search For Members')

    expect(page).to have_content("97 Total Members")
    expect(page).to have_css('.member', count: 25)

    members.each do |member|
      within("#member-#{member.id}") do
        expect(page).to have_content(member.name)
        expect(page).to have_css('img')
        expect(page).to have_content(member.allies.join(', '))
        expect(page).to have_content(member.enemies.join(', '))
        expect(page).to have_content(member.affiliation.join(', '))
      end
    end
  end
end
