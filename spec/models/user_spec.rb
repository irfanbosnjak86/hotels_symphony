require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { described_class.new(email: email, display_name: display_name, role: role, password: password) }
    let(:email) { 'test@text.com' }
    let(:display_name) { 'test_user' }
    let(:role) { 'admin' }
    let(:password) { '12345678' }

    it { is_expected.to be_valid }

    context 'when email is missing' do
      let(:email) { nil }
      it { is_expected.to be_invalid }
    end

    context 'when email is not uniq' do
      before do
        create(:user, email: email)
      end

      it { is_expected.to be_invalid }
    end
  end
end
