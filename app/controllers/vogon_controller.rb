class VogonController < ApplicationController
  def ping
    render json: {
      pong: "What is the air speed velocity of a coconut laiden swallow?"
    }
  end
end
