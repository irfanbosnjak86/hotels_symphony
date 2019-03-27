require 'rails_helper'

RSpec.describe Api::AuthController, type: :controller do
  describe '#create' do
    let(:user) { create(:user, email: 'test@text.com') }
    context 'with valid credentials' do
      it 'responds with status' do
        get :create, params: { email: user.email, password: '12345678' }
        expect(response).to be_created
      end
    end

    context 'with invalid credentials' do
      it 'responds with status' do
        get :create, params: { email: user.email, password: '123456789' }
        body = JSON.parse(response.body)
        expect(response.status).to eq 401
        expect(body['message']).to eq 'Unauthenticated'
      end
    end
  end
end
