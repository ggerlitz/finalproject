class InspirationsController < ApplicationController
	before_action :set_inspiration, only: [:show, :edit, :update, :destroy]
  def index
  	@inspiration = Inspiration.all
  end

  def new
  	@inspiration = Inspiration.new
  end

  def create
  	@inspiration = Inspiration.new(inspiration_params)
  	if @inspiration.save
  		redirect_to @inspiration, notice: "Submitted successfully"
  	else
  		render :new, notice: "There was a problem"
  	end
  end

  def show
  end

  def edit
  end

  def update
  	@inspiration = Inspiration.update(inspiration_params)
  	if @inspiration.save
  		redirect_to @inspiration, notice: "Your changes were submitted successfully"
  	else
  		render :edit, notice: "There was a problem"
  	end
  end

  def destroy
  	@inspiration.destroy
  	redirect_to inspiration_path, notice: "Deleted successfully"
  end

  private

  def set_inspiration
  	@inspiration = Inspiration.find(params[:id])
  end

  def inspiration_params
  	params.require(:inspiration).permit(:title, :body, :image).merge(user: current_user)
  end
end
