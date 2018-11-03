class Api::V1::FindUbs
  include Wisper::Publisher

  def initialize(params)
    @query = params[:query],
    @per_page = params[:per_page]
  end

  def call
    ubs = find_ubs
    if ubs
      broadcast(:success, ubs)
    else
      broadcast(:failed)
    end
  end

  def find_ubs
    if @query[0].present?
      lat_long = @query[0]
      BasicHealthUnit.by_distance(origin: lat_long).page(@page).per(@per_page)
    end
  end
end
