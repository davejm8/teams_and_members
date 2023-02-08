class MembersController < ApplicationController

  def index
    if injured_param[:injured] == "true"
      @members = Member.injured_sort
      @header = "Injured:"
    else
      @members = Member.all
      @header = "Members"
    end
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

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to "/members"
  end

  private
  def update_params
    params.permit(:name, :wage, :injured, :team_id)
  end

  def injured_param
    params.permit(:injured)
  end
end