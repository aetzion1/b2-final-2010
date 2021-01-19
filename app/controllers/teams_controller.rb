class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
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
      flash.notice = 'Team not registered: Missing required info'
      redirect_to new_competition_team_path(@competition)
    end
  end

  private
  def team_params
    params.require(:team).permit(:hometown, :nickname)
  end
end
