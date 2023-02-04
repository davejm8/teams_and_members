class TeamsController < ApplicationController

  def index
    @teams = Team.all.sort_by {|k| k.created_at}.reverse
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    
  end

  def create
    team = Team.create!({
      name: params["name"],
      games_won: params["games_won"],
      won_championship: params["won_championship"]
      })

    team.save
    redirect_to '/teams'
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    team.save
    redirect_to "/teams/#{team.id}"
  end

  def team_params
    params.permit(:name, :games_won, :won_championship)
  end
end