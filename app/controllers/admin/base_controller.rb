class Admin::BaseController < ApplicationController
  protect_from_forgery
  layout 'admin'

  before_filter :authorize

  private

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

end
