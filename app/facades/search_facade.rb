class SearchFacade
  def self.find_members(nation)
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=#{nation.gsub('_', '+')}") do |req|
      req.params['perPage'] = 25
    end
    body = JSON.parse(response.body, symbolize_names: true)
    if body.size == 25
      page = 1
      results = [0]
      until results.size == 0
        page += 1
        results = get_additional_pages(nation, page)
        body << results
      end
    end
    @member_count = body.flatten.size
    body.first(25).map do |member_hash|
      Member.new(member_hash)
    end
  end

  def self.get_additional_pages(nation, page)
    response = Faraday.get("https://last-airbender-api.herokuapp.com/api/v1/characters?affiliation=#{nation.gsub('_', '+')}") do |req|
      req.params['perPage'] = 25
      req.params['page'] = page
    end
    body = JSON.parse(response.body, symbolize_names: true)
  end
end
