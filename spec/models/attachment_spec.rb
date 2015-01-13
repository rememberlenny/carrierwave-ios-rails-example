require 'rails_helper'

describe Attachment do
  subject(:attachment) { build :attachment }

  it { is_expected.to be_valid }

  describe 'validations' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of :file }
  end
end
