FactoryGirl.define do
  factory :photo do
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'photos', 'images', 'netguru.jpg'))
  end
end
