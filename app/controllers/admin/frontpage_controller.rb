class Admin::FrontpageController < Admin::BaseController

  def index
  end

  def update
    Project.update_all("window_ordinal = 0")
    params[:project].each_with_index do |project_number, index|
      project = Project.find(project_number.to_i)
      project.window_ordinal = index + 1
      project.save
    end
    render text: 'done'
  end

end
