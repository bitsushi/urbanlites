class Download < ActiveRecord::Base
  mount_uploader :file, FileUploader

  validates_presence_of :name, :file

  def to_s
    name
  end
end
