require 'spec_helper'

describe Attachment do
  subject(:attachment) { build :attachment }

  it { is_expected.to be_valid }

  describe 'validations' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of :file }
  end

  describe '#filename' do
    context 'when no file present' do
      subject { build :attachment, file: nil }

      it 'returns nil' do
        expect(subject.filename).to be_nil
      end
    end

    context 'when file present' do
      subject { create :attachment }

      it 'returns it\'s name' do
        expect(subject.filename).to eq 'netguru.jpg'
      end
    end
  end

  describe 'scopes' do
    describe '.old' do
      subject { Attachment.old }

      let!(:old_attachment) { create(:attachment, created_at: Time.parse('2015-01-01 10:00 UTC')) }
      let!(:young_attachment) { create(:attachment, created_at: Time.parse('2015-01-01 10:10 UTC')) }

      before(:each) do
        freeze_time('2015-01-01 10:15 UTC')
        stub_const('Attachment::OLD_AFTER', 10.minutes)
      end

      it 'returns only records older than threshold' do
        expect(subject).to include(old_attachment)
        expect(subject).to_not include(young_attachment)
      end
    end
  end
end
