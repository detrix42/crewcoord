class HomeController < ApplicationController
  before_action :check_manager_business, except: %i[landing]

  def landing
    @manager = manager
  end
end
