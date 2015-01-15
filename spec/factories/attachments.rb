FactoryGirl.define do
  factory :attachment do
    file Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'attachments', 'files', 'netguru.jpg'))
  end

  factory :unsupported_attachment, class: Attachment do
    file Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'attachments', 'files', 'unsupported_file.bad'))
  end
end
