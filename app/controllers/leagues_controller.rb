class LeaguesController < ApplicationController
  def create
    @league  = League.create(league_params)
    redirect_to leagues_path
  end

  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  private
  def league_params
    params.required(:league).permit([:name])
  end
end
