class BatchesController < ApplicationController
  def index
  end

  def show
    @batch = Batch.find(params[:id])
    @groups = @batch.groups
  end

  def new
  end

  def edit
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @cohort.batches.create(batch_params)
    redirect_to @cohort
  end

  def update
  end

  def destroy
  end

  protected
  def batch_params
    params.require(:batch).permit(:size)
  end
end
