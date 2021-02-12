class SearchController < ApplicationController
  def index
    @members = SearchFacade.find_members(params[:nation])
    @member_count = SearchFacade.member_count
  end
end
