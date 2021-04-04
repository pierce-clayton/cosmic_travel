class MissionsController < ApplicationController
  before_action :find_mission, only: %i[show edit update destroy]

  def index
    @missions = Mission.all
  end

  def new
    @scientists = Scientist.all
    @planets = Planet.all
    @mission = Mission.new
  end

  def create
    # byebug
    @mission = Mission.new(mission_params)

    @mission.save ? (redirect_to mission_path(@mission.id)) : (redirect_to mission_path(:new))
  end

  def show; end

  private

  def find_mission
    @mission = Mission.find_by(id: params[:id])
  end

  def mission_params
    params.require(:mission).permit(%i[name scientist_id planet_id])
  end
  
end
