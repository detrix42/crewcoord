require 'jdl_rnd'

class SessionController < ApplicationController
  def signup
    rnd = RND.new
    @token = rnd.token


    @business = Business.new
    @business.build_crew_member
  end

  def login
  end

end
