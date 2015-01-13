require 'rails_helper'

describe AttachmentsController do
  describe 'POST create' do
    context 'when invalid params' do
      let(:invalid_params) do
        { file: nil }
      end

      before do
        post :create, attachment: invalid_params
      end

      it { is_expected.to respond_with :unprocessable_entity }
    end

    context 'when valid' do
      let(:valid_params) { attributes_for :attachment }

      before do
        post :create, attachment: valid_params
      end

      it { is_expected.to respond_with :created }
      it { expect(response.location).to match /http/ }
    end
  end

  describe 'GET show' do
    let(:attachment) { create :attachment }

    before do
      get :show, id: attachment.id
    end

    it { is_expected.to respond_with :redirect }
  end

  describe 'GET index' do
    before do
      get :index
    end

    it { is_expected.to respond_with :ok }
  end
end
