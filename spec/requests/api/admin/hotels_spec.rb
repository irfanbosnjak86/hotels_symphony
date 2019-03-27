require 'rails_helper'

RSpec.describe 'Admin hotel CRUD', type: :request do
  let(:response_data) { JSON.parse(response.body) }
  let(:name) { 'Test Hotel' }
  let(:address) { 'Test address' }
  let(:description) do
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        end Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
  end
  let(:user) { create(:user, role: role) }
  let(:role) { 'admin' }

  describe 'POST /api/admin/hotels' do
    let(:request) do
      post '/api/admin/hotels', params: { name: name,
                                          address: address,
                                          description: description },
                                headers: { 'Authorization' => "Bearer #{user.authentication_token}" }
    end

    context 'when loged in as admin' do
      context 'with valid params' do
        it 'responds with status created and returns token' do
          expect { request }.to change { Hotel.count }.from(0).to(1)
          expect(response).to be_created
        end
      end

      context 'with invalid params' do
        let(:name) { nil }

        it 'bad request' do
          expect { request }.not_to change { Hotel.count }
          expect(response.status).to eq 400
          expect(response_data['errors'].first).to eq 'Name can\'t be blank'
        end
      end
    end

    context 'when without admin privileges' do
      let(:role) { 'regular_user' }

      it 'bad request' do
        expect { request }.not_to change { Hotel.count }
        expect(response.status).to eq 401
        expect(response_data['message']).to eq 'Unauthorized'
      end
    end
  end
end
