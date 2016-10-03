class ExtractMaterialsController < ApplicationController

  def index
    results = Material.extract_materils(required_params)
    render json: results
  end

  private

  def required_params
    params.permit(:brand_id, :category_id)
  end

end
