require 'rubygems'
require 'oauth2'
require 'clio_client'

class AuthsRequest < ApplicationController

  def ClioGetRedirectUrl
    
    access = Access.new;
    
    access.client_id = 'rVUqQhIrJEVkkSVo3uSyrRgDzzLum1b8J1NJ4Dtv';
    access.client_secret = 'jjF3E6Lyx48yk7QkNvE7IykYr6iJIHBx8C7cBaS4';
    access.client_callback_url = "http://192.168.2.103:3000/callback";
    access.save;
#    client_url = "https://app.goclio.com/oauth/approval";

    client = ClioClient::Session.new({client_id: access.client_id, 
                                      client_secret: access.client_secret,
                                     client_url: access.client_callback_url});

   my_response_url = client.authorize_url(access.client_callback_url);
    
   return my_response_url;
 
  end

  def ClioGetToken


  end
end
