require 'spec_helper'

describe AttachmentsController do
  describe 'GET index' do
    before do
      get :index
    end

    it { is_expected.to respond_with :ok }
  end
end
