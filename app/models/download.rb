class Download < ActiveRecord::Base
  mount_uploader :file, FileUploader

  validates_presence_of :name, :file

  default_scope order('ordinal ASC, id DESC')

  def to_s
    name
  end
end
