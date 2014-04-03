require 'cgi'
require 'uri'
require 'rubygems'
require 'oauth2'
require 'clio_client'

class CallbackController < ApplicationController
  def index
    logger.info 'callback controller:  code received'
    logger.info request.original_url.to_s;
    url = request.original_url.to_s;
    uri = URI.parse(url);
    parms = CGI::parse(uri.query);
    $code = parms['code'];
    logger.info "$code #{$code}";

    $client.authorize_with_code($client_callback_url, $code);
#$client.authorize_with_code "https://app.goclio.com/oauth/approval", $code;
#   token = $client.auth_code.get_token($code, :redirect_uri => 'http://home.gardenway.org:3000/callback')
# saved_token = token.token

    if $client.authorized?
      saved_token = $client.access_token
      logger.info "saved_token: " + saved_token.to_s;
    else
      logger.info "not authorized";
    end

    me = $client.users.who_am_i
    logger.info "Token saved for #{me[1].first_name} #{me[1].last_name} of #{me[0].name}"	

  end

end
