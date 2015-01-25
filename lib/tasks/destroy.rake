namespace :destroy do
  desc 'Delete attachments older than threshold'
  task :old_attachments => :environment do
    Attachment.old.each(&:destroy)
  end
end