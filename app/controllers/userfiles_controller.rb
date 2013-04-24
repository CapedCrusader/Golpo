class UserfilesController < ApplicationController
  def index
    @userfiles = Userfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @userfiles.map{|userfile| userfile.to_jq_upload } }
    end
  end

  # GET /userfiles/1
  # GET /userfiles/1.json
  def show
    @userfile = Userfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @userfile }
    end
  end

  # GET /userfiles/new
  # GET /userfiles/new.json
  def new
    @userfile = Userfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @userfile }
    end
  end

  # GET /userfiles/1/edit
  def edit
    @userfile = Userfile.find(params[:id])
  end

  # POST /userfiles
  # POST /userfiles.json
  def create
      @userfile = Userfile.new(params[:userfile])

      respond_to do |format|
        if @userfile.save
          format.html {
            render :json => [@userfile.to_jq_upload].to_json,
            :content_type => 'text/html',
            :layout => false
          }
          format.json { render json: [@userfile.to_jq_upload].to_json, status: :created, location: @userfile }
        else
          format.html { render action: "new" }
          format.json { render json: @userfile.errors, status: :unprocessable_entity }
        end
      end
    
  end

  # PUT /userfiles/1
  # PUT /userfiles/1.json
  def update
    @userfile = Userfile.find(params[:id])

    respond_to do |format|
      if @userfile.update_attributes(params[:userfile])
        format.html { redirect_to @userfile, notice: 'Userfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @userfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userfiles/1
  # DELETE /userfiles/1.json
  def destroy
    @userfile = Userfile.find(params[:id])
    @userfile.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end