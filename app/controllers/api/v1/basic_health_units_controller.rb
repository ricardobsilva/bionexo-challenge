class Api::V1::BasicHealthUnitsController < ApplicationController
  def find_ubs
    ubs = Api::V1::FindUbs.new(params)
    ubs.on(:success){|ubs|
                      render json: {
                        current_page: ubs.current_page,
                        per_page: params[:per_page].to_i,
                        total_entries: ubs.total_pages,
                        entries: ActiveModel::Serializer::CollectionSerializer.new(
                          ubs, serializer: Api::V1::Web::BasicHealthUnitSerializer
                        )}, status: :ok
                      }
    ubs.on(:failed){render json: {}, status: 422}
    ubs.call
  end

end
