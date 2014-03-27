require 'cgi'
require 'uri'


class CallbackController < ApplicationController
  def index
    logger.info 'calback controller:  code received'
    logger.info request.original_url.to_s;
    url = request.original_url.to_s;
    uri = URI.parse(url);
    parms = CGI::parse(uri.query);
    $code = parms['code'];
    logger.info "$code #{$code}";


  end
end
