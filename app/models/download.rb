class Download < ActiveRecord::Base
  mount_uploader :file, FileUploader
end
