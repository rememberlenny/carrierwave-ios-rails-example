require 'rails_helper'
require 'rake'

describe 'clean rake' do
  before(:all) do
    load File.expand_path('../../../lib/tasks/clean.rake', __FILE__)
    Rake::Task.define_task(:environment)
  end

  describe 'clean:old_attachments' do
    let!(:old_attachment) { create(:attachment) }
    let!(:young_attachment) { create(:attachment) }

    let(:run_rake_task) do
      Rake::Task['clean:old_attachments'].reenable
      Rake.application.invoke_task 'clean:old_attachments'
    end

    before(:each) do
      # stub .old scope to return old_attachment
      allow(Attachment).to receive(:old) { [old_attachment] }
    end

    it 'removes attachments with #destroy' do
      expect(old_attachment).to receive(:destroy)
      run_rake_task
    end

    it 'removes old attachments' do
      run_rake_task
      expect(Attachment.all).to include(young_attachment)
      expect(Attachment.all).to_not include(old_attachment)
    end
  end
end