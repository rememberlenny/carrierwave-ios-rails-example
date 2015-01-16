require 'factory_girl_rails'
require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.order = 'random'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def freeze_time(now = Time.now)
  datetime = DateTime.parse(now.to_s)
  time = Time.parse(now.to_s)

  allow(DateTime).to receive(:now) { datetime }
  allow(Time).to receive(:now) { time }
end

def fixture_file(filename)
  spec_tmp = File.join(Rails.root, '/tmp/spec')
  old_path = File.join(Rails.root, '/spec/fixtures/', filename)
  new_path = File.join(spec_tmp, filename)

  FileUtils.mkdir_p(spec_tmp) unless Dir.exists?(spec_tmp)
  FileUtils.cp(old_path, new_path)
  File.new(new_path)
end