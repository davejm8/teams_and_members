class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @members = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(update_params)
    member.save
    redirect_to "/members/#{member.id}"
  end

  private
  def update_params
    params.permit(:name, :wage, :injured, :team_id)
  end
end