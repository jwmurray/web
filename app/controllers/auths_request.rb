require 'rubygems'
require 'oauth2'

class AuthsRequest < ApplicationController

  def GetToken

    client_id = 'rVUqQhIrJEVkkSVo3uSyrRgDzzLum1b8J1NJ4Dtv';
    client_secret = 'jjF3E6Lyx48yk7QkNvE7IykYr6iJIHBx8C7cBaS4';
    client = OAuth2::Client.new(client_id, client_secret, 
                                :site => 'https://app.goclio.com/')

    logger.info 'Prior to request creation'
    client.auth_code.authorize_url(:redirect_uri => 
                                   'http://localhost/callback')

    redirect_uri = 'http:/localhost:3000/callback'
    code = 'secretcode'
    logger.info 'Prior to token request';
    token = client.auth_code.get_token(code, :redirect_uri => redirect_uri)
    saved_token = token.token

    logger.info 'token: ' + saved_token.to_s;
  end

  def ClioGetToken
    client_id = 'rVUqQhIrJEVkkSVo3uSyrRgDzzLum1b8J1NJ4Dtv';
    client_secret = 'jjF3E6Lyx48yk7QkNvE7IykYr6iJIHBx8C7cBaS4';
    client_url = "http://home.gardenway.org:3146";

    client = ClioClient::Session.new({client_id: client_id, 
                                      client_secret: client_secret,
                                     client_url: client_url});



   my_response_url = client.authorize_url(client_url);
   logger.info "response_url: " + my_response_url.to_s;
#   @authorization_token =  client.authorize_with_code(client_url, code);
#    logger.info "token: " + @authorization_token.to_s;
  end
end
