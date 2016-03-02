class SummonersController < ApplicationController
  def show
    @user = params[:id]

    summoner_api = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{@user}?api_key=8f169a2e-fd7a-483e-b324-ecfaf6b095b4"
    @summoner = JSON.load(open(URI.parse(URI.encode(summoner_api))))["#{@user}"]['id']

    matchlist_api = "https://na.api.pvp.net/api/lol/na/v2.2/matchlist/by-summoner/#{@summoner}?api_key=8f169a2e-fd7a-483e-b324-ecfaf6b095b4"
    @matchlist = JSON.load(open(URI.parse(URI.encode(matchlist_api))))
    @matches = @matchlist['matches'].first(3).map do |match|
    	@matchId = match['matchId']
    	match_api = "https://na.api.pvp.net/api/lol/na/v2.2/match/#{@matchId}?api_key=8f169a2e-fd7a-483e-b324-ecfaf6b095b4"
		@match = JSON.load(open(URI.parse(URI.encode(match_api))))
	end

  end

  def home
    @input = params[:id]
    if @input
      redirect_to "/summoners/show/#{@input}"
    end
  end

end
