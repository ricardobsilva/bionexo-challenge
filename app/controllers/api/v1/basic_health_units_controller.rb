class Api::V1::BasicHealthUnitsController < ApplicationController
  def find_ubs
    if request_params[:per_page].present?
      basic_health_unit = BasicHealthUnit.page(request_params[:page])
      .per(request_params[:per_page])
      render json: {
        current_page: basic_health_unit.current_page,
        per_page: request_params[:per_page].to_i,
        total_entries: basic_health_unit.total_pages,
        entries: ActiveModel::Serializer::CollectionSerializer.new(
          basic_health_unit, serializer: Api::V1::Web::BasicHealthUnitSerializer
        )
        }, status: :ok
    else
      render json: {}, status: 422
    end
  end

  private
  def request_params
    {
      query: params[:query],
      page: params[:page],
      per_page: params[:per_page]
    }
  end
end
