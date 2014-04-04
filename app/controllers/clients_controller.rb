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

    @contacts.each do |contact| 
      logger.info "contact: " + contact.name + " phone: " + contact.phone_numbers.to_s;

      if contact.last_name == 'White1' 
        contact.first_name = 'Gary ' + Time.now.strftime("%d/%m/%Y %H:%M");
        contact.save;
        logger.info "contact: " + contact.name + " phone: " + contact.phone_numbers.to_s;
        logger.info "contact.inspect(): " + contact.inspect();
      end
    end
  end
end
