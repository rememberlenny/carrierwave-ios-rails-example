class API::V1::ApiController < ActionController::Base
  respond_to :json

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end