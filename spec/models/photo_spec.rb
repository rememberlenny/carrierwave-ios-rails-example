require 'rails_helper'

describe Photo do
  subject(:photo) { build :photo }

  it { is_expected.to be_valid }

  describe 'validations' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of :name }
  end
end
