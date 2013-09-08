class GeneratorInfosController < ApplicationController
  # GET /generator_infos
  # GET /generator_infos.json
  def index
    @generator_infos = GeneratorInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @generator_infos }
    end
  end

  # GET /generator_infos/1
  # GET /generator_infos/1.json
  def show
    @generator_info = GeneratorInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @generator_info }
    end
  end

  # GET /generator_infos/new
  # GET /generator_infos/new.json
  def new
    @generator_info = GeneratorInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @generator_info }
    end
  end

  # GET /generator_infos/1/edit
  def edit
    @generator_info = GeneratorInfo.find(params[:id])
  end

  # POST /generator_infos
  # POST /generator_infos.json
  def create
    @generator_info = GeneratorInfo.new(params[:generator_info])

    respond_to do |format|
      if @generator_info.save
        format.html { redirect_to @generator_info, notice: 'Generator info was successfully created.' }
        format.json { render json: @generator_info, status: :created, location: @generator_info }
      else
        format.html { render action: "new" }
        format.json { render json: @generator_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /generator_infos/1
  # PUT /generator_infos/1.json
  def update
    @generator_info = GeneratorInfo.find(params[:id])

    respond_to do |format|
      if @generator_info.update_attributes(params[:generator_info])
        format.html { redirect_to @generator_info, notice: 'Generator info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @generator_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generator_infos/1
  # DELETE /generator_infos/1.json
  def destroy
    @generator_info = GeneratorInfo.find(params[:id])
    @generator_info.destroy

    respond_to do |format|
      format.html { redirect_to generator_infos_url }
      format.json { head :no_content }
    end
  end
end
