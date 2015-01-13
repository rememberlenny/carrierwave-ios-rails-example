ActiveAdmin.register Attachment do
  permit_params :file

  form do |f|
    f.inputs 'Attachment' do
      f.input :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :file do
        link_to attachment.file, attachment.file.url
      end
      row :created_at
      row :updated_at
    end
  end
end
