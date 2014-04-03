require 'rubygems'
require 'oauth2'
require 'clio_client'

class AuthsRequest < ApplicationController

  def ClioGetRedirectUrl
    client_id = 'rVUqQhIrJEVkkSVo3uSyrRgDzzLum1b8J1NJ4Dtv';
    client_secret = 'jjF3E6Lyx48yk7QkNvE7IykYr6iJIHBx8C7cBaS4';
    $client_callback_url = "http://home.gardenway.org:3000/callback";
#    client_url = "https://app.goclio.com/oauth/approval";

    $client = ClioClient::Session.new({client_id: client_id, 
                                      client_secret: client_secret,
                                     client_url: $client_callback_url});

   my_response_url = $client.authorize_url($client_callback_url);
   return my_response_url;
 
  end

  def ClioGetToken


#        redirect_to  "http://www.google.com", :status => 302;

#   logger.info "response_url: " + my_response_url.to_s;
   #controller.get :index

#   redirect_to   "http://google.com", :status => 302
#               notice: "Pay attention to the road");
#   @authorization_token =  client.authorize_with_code(client_url, code);
#    logger.info "token: " + @authorization_token.to_s;
  end
end
