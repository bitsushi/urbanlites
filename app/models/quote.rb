class Quote < ActiveRecord::Base
  attr_accessible :author, :body, :organisation, :project_id, :ordinal
  belongs_to :project
  default_scope order('id ASC')
end
