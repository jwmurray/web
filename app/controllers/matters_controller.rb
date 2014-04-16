require 'MatterUtils'
include MatterUtils

class MattersController < ApplicationController
  before_action :set_matter, only: [:show, :edit, :update, :destroy]

  # GET /matters
  # GET /matters.json
  def index
    @matters = Matter.all

    access = Access.last;


    client = ClioClient::Session.new({client_id: access.client_id, 
                                      client_secret: access.client_secret,
                                     client_url: access.client_callback_url});

    client.access_token = access.token;


    logger.info "access.token: " + access.token.to_s;
#    logger.info "dumping matters, client.matters: " + client.matters.inspect.to_s
     @clioMatters  = client.matters.list();

     @clioMatters.count.times do |i|
       #     1.times do |i|
       if(i == 6)
         matter = @clioMatters[i];
         #       logger.info matter.inspect().to_s;
         
         MatterDump(matter);

         #       m = @clioMatters[i];
         #       logger.info "Inspect matter[]#{i}]: " + @clioMatters[i].inspect() + "\n\n";
         myNewMatter = Matter.where(display_number: 
                                    @clioMatters[i].display_number).first;

         logger.info "\nmyNewMatter: " + myNewMatter.inspect() + "\n\n";

         if(myNewMatter == nil)
           myNewMatter = Matter.new;
           myNewMatter.display_number = @clioMatters[i].display_number;
           myNewMatter.save;
           logger.info "added matter " + myNewMatter.case_number.to_s;
         else
           
         end

       end
     end
     


  end

  # GET /matters/1
  # GET /matters/1.json
  def show
  end

  # GET /matters/new
  def new
    @matter = Matter.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  # POST /matters.json
  def create
    @matter = Matter.new(matter_params)

    respond_to do |format|
      if @matter.save
        format.html { redirect_to @matter, notice: 'Matter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @matter }
      else
        format.html { render action: 'new' }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matters/1
  # PATCH/PUT /matters/1.json
  def update
    respond_to do |format|
      if @matter.update(matter_params)
        format.html { redirect_to @matter, notice: 'Matter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matters/1
  # DELETE /matters/1.json
  def destroy
    @matter.destroy
    respond_to do |format|
      format.html { redirect_to matters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter
      @matter = Matter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_params
      params.require(:matter).permit(:case_number, :judge_id, :commissioner_id, :client_id, :opp_id, :court_id)
    end
end
