require 'jdl_rnd'

class BusinessController < ApplicationController
  def create_actual
    rnd = RND.new
    @token = rnd.token 64

    b_prms = create_params

    @business = Business.new(b_prms)

    if @business.save
      log(:info, "Business #{@business.name} created successfully")
      # business saved. connect manager to business
      @manager.update(business_id: @business.id)
      redirect_to root_path, notice: "Business profile for #{@business.name} was successfully created."
    else
      log(:error, "Failed to create business\n#{@business.errors.full_messages.join("\n")}")
      flash[:error] = @business.errors.full_messages
      redirect_to business_create_path
    end

  end

  def create
    @business = Business.new
  end

  private
  def create_params
  params.require(:business).permit(:name, :email, :phone,
                                   :address1, :address2,
                                   :city, :state, :zipcode)
  end
end
