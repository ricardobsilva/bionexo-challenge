require 'rails_helper'

RSpec.describe '/api/v1/basic_health_units', type: :request do
  def json_body
    @json_body ||= JSON.parse(response.body, symbolize_names: true)
  end

  describe 'GET #find_ubs' do
    context 'When did pass params' do
      before(:each) do
        get '/api/v1/find_ubs', params: {page: 1, per_page: 10, query: '-23.604936,-46.692999'}
      end

      it 'return ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'render object json with key current_page' do
        expect(json_body).to include(:current_page)
      end

      it 'render object json with key per_page' do
        expect(json_body).to include(:per_page)
      end

      it 'render object json with key total_entries' do
        expect(json_body).to include(:total_entries)
      end

      it 'render object json with key total_entries' do
        expect(json_body).to include(:entries)
      end
    end
  end

  context 'When did not pass params' do
    before(:each) do
      get '/api/v1/find_ubs', params: {}
    end

    it 'return Unprocessable Entity' do
      expect(response).to have_http_status(422)
    end
  end
end
