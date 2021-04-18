class RunRecordsController < ApplicationController
  before_action :set_run_record, only: [:show, :update, :destroy]

  # GET /run_record
  def index
    @run_record = RunRecord.all

    render json: @run_record
  end

  # GET /run_records/1
  def show
    render json: @run_record
  end

  # POST /run_records
  def create
    ps = request.params['run_record']
    @run_record = RunRecord.new(ps)

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
      # TODO: 17J1 is this the right way to do this ? these are uri params not body yes ?
      params.fetch(:run_record, {})
      #params.require(:run_record).permit(:execution_time, :result, :details, :spec_id)
    end
end
