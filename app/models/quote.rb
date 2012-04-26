class Quote < ActiveRecord::Base
  attr_accessible :author, :body, :organisation, :project_id, :ordinal
  belongs_to :project
  default_scope order('ordinal ASC, id DESC')
end
