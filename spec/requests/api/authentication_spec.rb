require 'rails_helper'

RSpec.describe 'Authenticating user', type: :request do
  let(:response_data) { JSON.parse(response.body) }
  describe 'POST /api/sign_in' do
    let(:user) { create(:user, email: 'test@text.com') }
    context 'with valid credentials' do
      it 'responds with status created and returns token' do
        post '/api/sign_in', params: { email: user.email, password: '12345678' }
        expect(response).to be_created
        expect(response_data['authentication_token']).to eq user.reload.authentication_token
      end
    end
  end
end
