class TeamMembersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @members = @team.members
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create_member
    member = Member.new(member_params)
    member.save
    redirect_to "/teams/#{member.team_id}/members"
  end

  private
  def member_params
    params.permit(:name, :wage, :injured, :team_id)
  end
end