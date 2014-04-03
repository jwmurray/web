require 'rubygems'
require 'oauth2'
require 'clio_client'

class ClientsController < ApplicationController
  def index
    access = Access.last;


    client = ClioClient::Session.new({client_id: access.client_id, 
                                      client_secret: access.client_secret,
                                     client_url: access.client_callback_url});

    client.access_token = access.token;

    @me = client.users.who_am_i
    logger.info "Token saved for #{@me[1].first_name} #{@me[1].last_name} of #{@me[0].name}"
    
  end
end
