class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]
  # # GET /images or /images.json
  def index
    if params[:company_id]
      @jobs = Company.find(params[:company_id]).jobs
    else
      @jobs = Job.all
    end
    render json: { companies: @jobs }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @company
  end

  def create
    @company = Job.new(job_params)
    if @company.save
      render json: @company.as_json, status: :created
    else
      render json: { user: @company.errors, status: :no_content }
    end
  end

  def update
    if @company.update(job_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  private

  def set_job
    @company = Job.find(params[:id])
  end

  def job_params
    params.permit(:place, :company_id, :name)
  end
end
