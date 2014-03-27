class CallbackController < ApplicationController
  def index
    logger.info 'calback controller:  token received'
  end
end
