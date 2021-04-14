class RunRecordsController < ApplicationController
  before_action :set_run_record, only: [:show, :update, :destroy]

  # GET /run_record
  def index
    @run_record = RunRecord.all

    render json: @run_record
  end

  # GET /execution_records/1
  def show
    render json: @run_record
  end

  # POST /run_records
  def create
    @run_record = TestExecution.new(run_record_params)

    if @run_record.save
      render json: @run_record, status: :created, location: @run_record
    else
      render json: @run_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /run_records/1
  def update
    if @run_record.update(run_record_params)
      render json: @run_record
    else
      render json: @run_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /run_records/1
  def destroy
    @run_record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_record
      @run_record = RunRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def run_record_params
      params.require(:run_record).permit(:execution_time, :result, :details, :test_case_id)
    end
end
