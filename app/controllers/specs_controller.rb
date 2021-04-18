class SpecsController < ApplicationController
  before_action :set_spec, only: [:show, :update, :destroy]

  # GET /specs
  def index

    out = SpecsHelper.match_specs_with_executions
    render json: out
  end

  # GET /specs/1
  def show
    iid = request.params['id'].to_i
    spec = Spec.find(iid)
    runs = RunRecord.where(spec_id: iid)
    out = {
      spec: spec,
      run_records: runs,
    }
    render json: out
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
