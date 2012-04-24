class Ethos < ActiveRecord::Base
  attr_accessible :description, :headline, :ordinal

  def to_s
    headline
  end
end
