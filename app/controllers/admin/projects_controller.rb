class Admin::ProjectsController < Admin::BaseController

  def sort
    params[:project].each_with_index do |id, index|
      Project.update_all({ordinal: index+1}, {id: id})
    end
    render nothing: true
  end

  def update_frontpage_items
    Project.update_all("window_ordinal = 0")
    params[:project].each_with_index do |project_number, index|
      project = Project.find(project_number.to_i)
      project.window_ordinal = index + 1
      project.save
    end
    render text: 'done'
  end

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    1.times do
      @project.quotes.build
    end

    1.times do
      @project.photos.build
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])

    1.times do
      @project.quotes.build
    end

    1.times do
      @project.photos.build
      # @project.videos.build
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to admin_projects_url, notice: 'Project was successfully created.' }
      else

        1.times do
          @project.quotes.build
        end

        1.times do
          @project.photos.build
        end

        format.html { render action: "new" }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to admin_projects_url, notice: 'Project was successfully updated.' }
      else

        1.times do
          @project.quotes.build
        end

        1.times do
          @project.photos.build
        end

        format.html { render action: "edit" }
      end
    end
  end


  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to admin_projects_url }
    end
  end
end
