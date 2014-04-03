class DocsController < ApplicationController
  def index
  end

  def ping
    logger.info '+++ Received Ping +++'
    redirect_to docs_pong_path , notice: 'Ping pong!';
  end

  def pong
    logger.info '--- Arrived at pong ---'
  end
end
