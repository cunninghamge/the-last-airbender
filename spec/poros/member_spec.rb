require 'rails_helper'

RSpec.describe Member do
  it 'exists and has attributes' do
    data = {
        "_id": "5cf5679a915ecad153ab68cc",
        "allies": [
            "Fire Nation"
        ],
        "enemies": [
            "Aang"
        ],
        "photoUrl": "https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128",
        "name": "Afiko",
        "affiliation": "Fire Nation"
    }
    member = Member.new(data)

    expect(member).to be_a(Member)
    expect(member).to have_attributes( id: data[:_id],
                                       name: data[:name],
                                       photo_url: data[:photoUrl],
                                       allies: data[:allies],
                                       enemies: data[:enemies],
                                       affiliation: data[:affiliation]
                                     )
  end
end
