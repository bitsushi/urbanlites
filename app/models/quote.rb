class Quote < ActiveRecord::Base
  attr_accessible :author, :body, :organisation, :project_id, :ordinal, :position
  belongs_to :project
  default_scope order('id ASC')
end
