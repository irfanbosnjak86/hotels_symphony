require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validations' do
    subject { described_class.new(name: name, address: address, description: description) }
    let(:name) { 'Test Hotel' }
    let(:address) { 'Test address' }
    let(:description) do
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        end Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
    end

    it { is_expected.to be_valid }

    context 'when name is missing' do
      let(:name) { nil }
      it { is_expected.to be_invalid }
    end

    context 'when address is missing' do
      let(:address) { nil }
      it { is_expected.to be_invalid }
    end

    context 'when description is missing' do
      let(:description) { nil }
      it { is_expected.to be_invalid }
    end
  end
end
