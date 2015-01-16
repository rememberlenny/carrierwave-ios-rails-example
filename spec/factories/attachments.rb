FactoryGirl.define do
  factory :attachment do
    file Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/netguru.jpg")
  end

  factory :unsupported_attachment, class: Attachment do
    file Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/unsupported_file.bad")
  end
end
