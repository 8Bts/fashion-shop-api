require 'rails_helper'

RSpec.describe 'Items', type: :request do
  let!(:items) { create_list(:item, 10) }
  let(:item_id) { items.first.id }

  describe 'GET /items' do
    before { get '/items' }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /items/:id' do
    before { get "/items/#{item_id}" }
    context 'when the record exists' do
      it 'returns the item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe 'POST /items' do
    let(:valid_attributes) do
      { title: 'T-shirt', price: 200, image: 'https://foo.com', img_public_id: 'asdasc12', category: 'T-Shirts' }
    end

    context 'when the request is valid' do
      before do
        Category.create(name: 'T-Shirts')
        post '/items', params: valid_attributes
      end

      it 'creates a item' do
        expect(json['title']).to eq('T-shirt')
        expect(json['price']).to eq(200)
        expect(json['image']).to eq('https://foo.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before do
        Category.create(name: 'T-Shirts')
        post '/items', params: { title: 'F', category: 'T-Shirts' }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /items/:id' do
    let(:valid_attributes) do
      { title: 'T-shirt', price: 300, image: 'https://foo.com', img_public_id: 'asdas', category: 'T-Shirts' }
    end

    context 'when the record exists' do
      before do
        Item.find(item_id).categories << Category.create(name: 'T-Shirts')
        put "/items/#{item_id}", params: valid_attributes
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /items/:id' do
    before { delete "/items/#{item_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
