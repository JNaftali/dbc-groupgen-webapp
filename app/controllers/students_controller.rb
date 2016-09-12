class StudentsController < ApplicationController
  def index
    
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  before_action :get_cohort
  protected

  def get_cohort
    @cohort = Cohort.find(params[:id])
  end
end
