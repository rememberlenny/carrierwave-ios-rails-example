FactoryGirl.define do
  factory :attachment do
    file Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'attachments', 'files', 'netguru.jpg'))
  end
end
