class Admin::EthosesController < Admin::BaseController

  # GET /ethoses
  # GET /ethoses.json
  def index
    @ethoses = Ethos.all
  end

  # GET /ethoses/new
  # GET /ethoses/new.json
  def new
    @ethos = Ethos.new
  end
  #
  # # GET /ethoses/1/edit
  def edit
    @ethos = Ethos.find(params[:id])
  end
  #
  # # POST /ethoses
  # # POST /ethoses.json
  def create
    @ethos = Ethos.new(params[:ethos])

    respond_to do |format|
      if @ethos.save
        format.html { redirect_to admin_ethoses_url, notice: 'Ethos was succesesfully created.' }
        format.json { render json: @ethos, status: :created, location: @ethos }
      else
        format.html { render action: "new" }
        format.json { render json: @ethos.errors, status: :unprocesesable_entity }
      end
    end
  end

  # PUT /ethoses/1
  # PUT /ethoses/1.json
  def update
    @ethos = Ethos.find(params[:id])

    respond_to do |format|
      if @ethos.update_attributes(params[:ethos])
        format.html { redirect_to admin_ethoses_url, notice: 'Ethos was succesesfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ethos.errors, status: :unprocesesable_entity }
      end
    end
  end

  # DELETE /ethoses/1
  # DELETE /ethoses/1.json
  def destroy
    @ethos = Ethos.find(params[:id])
    @ethos.destroy

    respond_to do |format|
      format.html { redirect_to ethoses_url }
      format.json { head :no_content }
    end
  end
end
