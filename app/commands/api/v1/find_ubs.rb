class Api::V1::FindUbs
  include Wisper::Publisher

  def initialize(params)
    @query = params[:query],
    @page = params[:page],
    @per_page = params[:per_page]
  end

  def call
    ubs = find_ubs
    if @per_page.present?
      broadcast(:success, ubs)
    else
      broadcast(:failed)
    end
  end

  def find_ubs
    BasicHealthUnit.page(@page)
                   .per(@per_page)
  end
end
