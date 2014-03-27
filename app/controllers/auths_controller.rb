class AuthsController < ApplicationController
  before_action :set_auth, only: [:show, :edit, :update, :destroy]

  # GET /auths
  # GET /auths.json
  def index
logger.info "1."
    @auths = Auth.all
logger.info "2."

    @request = AuthsRequest.new;
logger.info "3."
    @redirect_url = @request.ClioGetRedirectUrl;

    redirect_to @redirect_url, :status => 302;
    @token = @request.ClioGetToken;
logger.info "4." + @token.to_s;
    
  end

  # GET /auths/1
  # GET /auths/1.json
  def show
  end

  # GET /auths/new
  def new
        redirect_to  "http://www.google.com", :status => 302;
#    @auth = Auth.new
  end

  # GET /auths/1/edit
  def edit
  end

  # POST /auths
  # POST /auths.json
  def create
    @auth = Auth.new(auth_params)

    respond_to do |format|
      if @auth.save
        format.html { redirect_to @auth, notice: 'Auth was successfully created.' }
        format.json { render action: 'show', status: :created, location: @auth }
      else
        format.html { render action: 'new' }
        format.json { render json: @auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auths/1
  # PATCH/PUT /auths/1.json
  def update
    respond_to do |format|
      if @auth.update(auth_params)
        format.html { redirect_to @auth, notice: 'Auth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auths/1
  # DELETE /auths/1.json
  def destroy
    @auth.destroy
    respond_to do |format|
      format.html { redirect_to auths_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth
      @auth = Auth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_params
      params.require(:auth).permit(:token, :secret, :username)
    end
end
