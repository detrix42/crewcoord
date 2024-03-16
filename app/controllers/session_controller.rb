class SessionController < ApplicationController
  def signup
    @business = Business.new
    @business.build_crew_member
  end

  def login
  end

end
