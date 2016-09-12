class CohortsController < ApplicationController
  def index
    @cohorts = current_user.cohorts
  end

  def show
    @cohort = Cohort.find(params[:id])
    @students = @cohort.students
  end

  def new
    @cohort = current_user.cohorts.new
  end

  def edit
  end

  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      redirect_to @cohort
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
  def cohort_params
    params.require(:cohort).permit(:name)
  end
end
