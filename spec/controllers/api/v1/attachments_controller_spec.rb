require 'spec_helper'

describe API::V1::AttachmentsController do
  shared_examples_for 'respond with representation of attachment' do
    it 'returns attachment id' do
      expect(json_response[:attachment][:id]).to be_an Integer
    end

    it 'returns attachment file url' do
      expect(json_response[:attachment][:file]).to be_an String
    end
  end

  describe 'GET index' do
    before do
      create :attachment
      create :attachment
      get :index
    end

    it { is_expected.to respond_with :ok }
    it { expect(json_response[:attachments].count).to eq 2 }
  end

  describe 'GET show' do
    let(:attachment) { create :attachment }

    before { get :show, id: attachment.id }

    it { is_expected.to respond_with :ok}
    it_behaves_like 'respond with representation of attachment'
  end

  describe 'POST create' do
    context 'when valid params' do
      let(:valid_params) { attributes_for :attachment }

      before { post :create, attachment: valid_params }

      it { is_expected.to respond_with :created }
      it_behaves_like 'respond with representation of attachment'
    end

    context 'when no file present in params' do
      let(:invalid_params) { Hash[file: nil] }

      before { post :create, attachment: invalid_params }

      it { is_expected.to respond_with :unprocessable_entity }
    end

    context 'when file extension not supported' do
      let(:params) { attributes_for :unsupported_attachment }

      before { post :create, attachment: params }

      it { is_expected.to respond_with :unprocessable_entity }
    end
  end

  describe 'DELETE destroy' do
    let!(:attachment) { create :attachment }

    before do
      delete :destroy, id: attachment
    end

    it 'removes given attachment' do
      expect(Attachment.find_by id: attachment).to eq nil
    end

    it { is_expected.to respond_with :ok }
  end
end
