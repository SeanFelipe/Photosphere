class SearchController < ApplicationController
  def search
    summary = request.params['summary']
    slt = Spec.where(summary: summary).first
    iid = slt ? slt.id : 'not found'
    out = { spec_id: iid }
    render json: out
  end
end
