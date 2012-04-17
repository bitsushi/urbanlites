class Service < ActiveRecord::Base

  validates_presence_of :name, :description

  def to_s
    name
  end
end
