class ScientistsController < ApplicationController
  before_action :set_scientist, only: [:show, :edit, :update, :destroy]

  def index
    @scientists = Scientist.all
  end

  def show; end

  def new
    @scientist = Scientist.new
  end

  def destroy
    @scientist.destroy
    redirect_to scientists_path
  end
  
  def create
    @scientist = Scientist.new(scientist_params)

    @scientist.save ? (redirect_to scientist_path(@scientist.id)) : (render :new)
  end

  def update
    @scientist.update(scientist_params) ? (redirect_to scientist_path(@scientist.id)) : (render :edit)
  end

  
  private

  def set_scientist
    @scientist = Scientist.find_by(id: params[:id])
  end

  def scientist_params
    params.require(:scientist).permit(:name, :field_of_study)
  end
end
