require 'rubygems'
require 'oauth2'
require 'clio_client'
require 'date'

class ClientsController < ApplicationController
  def index
    access = Access.last;


    client = ClioClient::Session.new({client_id: access.client_id, 
                                      client_secret: access.client_secret,
                                     client_url: access.client_callback_url});

    client.access_token = access.token;

    @me = client.users.who_am_i
    logger.info "Token reused for #{@me[1].first_name} #{@me[1].last_name} of #{@me[0].name}"
    

    @contacts  = client.contacts.list(type: 'Person');
    


    
    logger.info "contact:  " + @contacts[1].to_s;
    logger.info "contact.inspect(): " + @contacts[1].inspect();
    logger.info "contact.name: " + @contacts[1].name;

    @contacts.count.times do |i| 
#    2.times do |i|
      logger.info "contact[#{i}]: " + @contacts[i].name + " phone: " + 
        @contacts[i].phone_numbers.first.to_s;
      
      contact = Contact.where(name: @contacts[i].name).first;


      if contact == nil 
        logger.info "answer: nil";
        contact = Contact.new;
        else
        contact.name = @contacts[i].name;
        contact.save;
      end

      if(contact.last_name != @contacts[i].last_name ||
         contact.first_name != @contacts[i].first_name)

        contact.last_name = @contacts[i].last_name;
        contact.first_name = @contacts[i].first_name;
        contact.name  = @contacts[i].name;
        contact.save;
      end
      logger.info "answer: #{contact.name}";

 #     @contacts[i].name = updatedNames[i];

 #     full_name = updatedNames[i];
 #     name = full_name.split(' ');

      
 #     first_name = name[0];
 #     (name.count - 2).times do |i|
 #       first_name += " " + name[i+1];
 #       end
      
 #     @contacts[i].first_name = first_name;
 #     @contacts[i].last_name = name.last;
#      @contacts[i].save
      
#      logger.info "contact[#{i}]: " + @contacts[i].name + " phone: " + @contacts[i].phone_numbers.to_s;
#        logger.info "contact.inspect(): " + @contacts[i].inspect();
      if 3 == 5
        contact.first_name = 'Gary ' + Time.now.strftime("%d/%m/%Y %H:%M");
        contact.save;
        logger.info "contact: " + contact.name + " phone: " + contact.phone_numbers.to_s;
        logger.info "contact.inspect(): " + contact.inspect();



      end
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :first_name, :last_name)
    end

end


