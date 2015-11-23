class MotivationsController < ApplicationController
	before_action :set_motivation, only: [:show, :edit, :update, :destroy]
  def index
  	@motivations = Motivation.all
    @user = current_user
  end

  def new
  	@motivation = Motivation.new
  end

  def create
  	@motivation = Motivation.new(motivation_params)
  	if @motivation.save
  		redirect_to motivations_path, notice: "Submitted successfully"
  	else
  		render :new, notice: "There was a problem"
  	end
  end

  def show
  end

  def edit
  end

  def update
  	@motivation.update(motivation_params)
  	if @motivation.save
  		redirect_to motivations_path, notice: "Your changes were submitted successfully"
  	else
  		render :edit, notice: "There was a problem"
  	end
  end

  def destroy
  	@motivation.destroy
  	redirect_to motivations_path, notice: "Deleted successfully"
  end

  private

  def set_motivation
  	@motivation = Motivation.find(params[:id])
  end

  def motivation_params
  	params.require(:motivation).permit(:title, :body, :image).merge(user: current_user)
  end
end
