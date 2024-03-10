class SessionController < ApplicationController
  def signup
    @business = Business.new
    @business.build_crew_manager
  end

  def login
  end

  def create
  end
end
