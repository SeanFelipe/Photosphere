class TestExecutionsController < ApplicationController
  before_action :set_test_execution, only: [:show, :update, :destroy]

  # GET /test_executions
  def index
    @test_executions = TestExecution.all

    render json: @test_executions
  end

  # GET /test_executions/1
  def show
    render json: @test_execution
  end

  # POST /test_executions
  def create
    @test_execution = TestExecution.new(test_execution_params)

    if @test_execution.save
      render json: @test_execution, status: :created, location: @test_execution
    else
      render json: @test_execution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_executions/1
  def update
    if @test_execution.update(test_execution_params)
      render json: @test_execution
    else
      render json: @test_execution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /test_executions/1
  def destroy
    @test_execution.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_execution
      @test_execution = TestExecution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_execution_params
      params.require(:test_execution).permit(:execution_time, :result, :details, :test_case_id)
    end
end
