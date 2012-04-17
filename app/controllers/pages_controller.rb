class PagesController < ApplicationController
  def home
    @projects = Project.window.all
  end
  def contact
  end
  def our_ethos
  end
end
