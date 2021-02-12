class SearchController < ApplicationController
  def index
    @members = find_members(params[:nation])
    @member_count = SearchFacade.member_count
  end
end
