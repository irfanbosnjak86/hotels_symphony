require 'rails_helper'

RSpec.describe API::HealthController, type: :controller do
  it 'responds with status' do
    get :index
    expect(response.status).to eq 200
  end
end