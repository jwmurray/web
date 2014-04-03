require 'cgi'
require 'uri'
require 'rubygems'
require 'oauth2'
require 'clio_client'

class CallbackController < ApplicationController
  def index
    access = Access.last;
    
    logger.info 'callback controller:  code received'
    logger.info request.original_url.to_s;
    url = request.original_url.to_s;
    uri = URI.parse(url);
    parms = CGI::parse(uri.query);
    access.client_code = parms['code'].to_s;
    code = parms['code'];

    logger.info "code #{code}";

    access.save;
    client = ClioClient::Session.new({client_id: access.client_id, 
                                      client_secret: access.client_secret,
                                     client_url: access.client_callback_url});

    logger.info "Client url: " + access.client_callback_url.to_s;
    logger.info "access.client_code: " + access.client_code.to_s;

    client.authorize_with_code(access.client_callback_url.to_s, code);

    if client.authorized?
      saved_token = client.access_token
      access.token = saved_token;
      logger.info "saved_token: " + saved_token.to_s;
      access.save;
    else
      logger.info "not authorized";
    end



    client.access_token = access.token;
    me = client.users.who_am_i
    logger.info "Token saved for #{me[1].first_name} #{me[1].last_name} of #{me[0].name}"	
    # logger.info "#{me}";

  end

end
