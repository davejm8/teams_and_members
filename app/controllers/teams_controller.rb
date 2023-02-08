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
    team = Team.new(team_params)
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

  def destroy
    team = Team.find(params[:id])
    team.members.destroy_all
    team.destroy
    redirect_to "/teams"
  end

  private
  def team_params
    params.permit(:name, :games_won, :won_championship)
  end
end