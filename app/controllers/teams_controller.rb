class TeamsController < ApplicationController

  def index
    @teams = Team.all.sort_by {|k| k.created_at}.reverse
  end

  def show
    @team = Team.find(params[:id])
  end
end