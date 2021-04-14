class SpecController < ApplicationController
  before_action :set_spec, only: [:show, :update, :destroy]

  # GET /specs
  def index
    out = Hash.new
    @specs = Spec.all
    executions = ExecutionRecords.all

    # get associated executions for each case
    exec_map = Hash.new
    executions.each {|ex| exec_map.store(ex.spec_id, ex)}

    breakpoint
    @specs.each do |ss|
      new = Hash.new
      new.store(:specs, ss)
      #history = Array.new
    end

    render json: out
  end

  # GET /specs/1
  def show
    render json: @specs
  end

  # POST /specs
  def create
    body = JSON.parse(request.raw_post)
    summary  = body['summary']
    description = body['description']

    @spec = Spec.new(summary: summary, description: description)


    if @spec.save
      render json: @spec, status: :created, location: @spec
    else
      render json: @spec.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spec/1
  def update
    if @spec.update(spec_params)
      render json: @spec
    else
      render json: @spec.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spec/1
  def destroy
    @spec.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spec_params
      params.fetch(:spec, {})
    end
end
