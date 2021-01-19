class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @team = Team.new(team_params)
    if @team.save
      CompetitionTeam.create(competition: @competition, team: @team)
      redirect_to competition_path(@competition)
    else
      flash.now[:error] = 'Team not registered: Missing required info'
      render :new
    end
  end

  private
  def team_params
    params.require(:team).permit(:hometown, :nickname)
  end
end
