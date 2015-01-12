require 'rails_helper'

describe PhotosController do
  describe 'POST create' do
    context 'when invalid params' do
      let(:invalid_params) do
        { image: nil }
      end

      before do
        post :create, photo: invalid_params
      end

      it { is_expected.to respond_with :unprocessable_entity }
    end

    context 'when valid' do
      let(:valid_params) { attributes_for :photo }

      before do
        post :create, photo: valid_params
      end

      it { is_expected.to respond_with :created }
      it { expect(response.location).to match /http/ }
    end
  end

  describe 'GET show' do
    let(:photo) { create :photo }

    before do
      get :show, id: photo.id
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
