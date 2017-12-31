require 'rails_helper'

RSpec.describe 'Author API', type: :request do
  let!(:authors)  { create_list(:author, 10) }
  let(:author_id) { authors.first.id }

  describe 'GET /authors' do
    before { get '/api/v1/authors' }

    it 'returns authors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    describe 'with pagination' do
      before { get '/api/v1/authors', params: { per_page: 1 } }

      it 'returns authors' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /authors/:id' do
    before { get "/api/v1/authors/#{author_id}" }

    context 'when the record exists' do
      it 'returns the author' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(author_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:author_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Record Not Found/)
      end
    end
  end

  describe 'POST /authors' do
    let(:valid_attributes) { attributes_for(:author) }

    context 'when the request is valid' do
      before { post '/api/v1/authors', params: valid_attributes }

      it 'creates a author' do
        expect(json['name']).to eq(valid_attributes[:name])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
