class AssessmentsController < ApplicationController
  before_action :set_assessment, only:[ :show, :edit, :update, :destroy]

  def index
    @assessments = Assessment.all
  end

  def new
    @assessment = Assessment.new
  end

  def edit
  end

  def show
  end

  def create
    @assessment = Assessment.new(assessment_params)
    if @assessment.save
      redirect_to current_user, notice: "Assessment completed successfully."
      UserMailer.welcome_email(current_user).deliver_now
    else
      render :new
    end
  end

  def update
    if @assessment.update
      redirect_to @assessment, notice: "Changes succcessfully saved."
    else
      render :edit
    end
  end

  def destroy
    @assessment.destroy
    redirect_to current_user, notice: "Assessment was deleted."
  end

  private

  def set_assessment
    @assessment = Assessment.find(params[:id])
  end

  def assessment_params
    params.require(:assessment).permit(:q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, 
                                       :passion_one, :passion_two, :passion_three, :passion_four, 
                                       :passion_five, :user_id).merge(user: current_user)
  end
end
  