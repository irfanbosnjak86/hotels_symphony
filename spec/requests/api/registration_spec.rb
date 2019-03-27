require 'rails_helper'

RSpec.describe 'User registration', type: :request do
  let(:response_data) { JSON.parse(response.body) }

  describe 'POST /api/sign_up' do
    context 'with valid params' do
      it 'responds with status created and returns token' do
        post '/api/sign_up', params: { email: 'test@test.com', password: '12345678' }
        expect(response).to be_created
        expect(response_data['authentication_token']).to eq User.last.reload.authentication_token
        expect(User.last.regular_user?).to eq true
      end
    end

    context 'with invalid params' do
      it 'bad request' do
        post '/api/sign_up', params: { email: 'test@test.com' }
        expect(response.status).to eq 400
        expect(response_data['errors'].first).to eq 'Password can\'t be blank'
      end
    end
  end
end
