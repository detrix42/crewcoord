require 'jdl_rnd'

class BusinessController < ApplicationController
  def create
    rnd = RND.new
    @token = rnd.token 64

    b_prms = create_params
    cm = CrewMember.new(b_prms[:crew_member_attributes])
    cm.is_crew_manager = true

    @business = Business.new(b_prms)
    @business.crew_member = cm

    if @business.save
      log(:info, "Business #{@business.name} created successfully")
      cm.business = @business
      ManagerConfirmation.new(manager_id: cm.id, token: @token).save
    else
      log(:error, "Business #{@business.name} " +
        "not created for the followig reasons:\n" +
        "#{@business.errors.full_messages.join("\n")}")
    end

    if cm.errors.empty?
      log(:info, "Crew Member (Manager) created successfully")
    else
      log(:error, "Crew Member (Manager)" +
        " not created for the following reasons:\n" +
        "#{cm.errors.full_messages.join("\n")}")
    end

    if @business.errors.empty?
      log(:info, "Business created successfully")
      redirect_to '/'
    else
      log(:error, "Failed to create business\n#{@business.errors.full_messages.join("\n")}")
      render 'session/create'
end
  end

  private
  def create_params
  params.require(:business).permit(:name, :email, :phone,
                                   :address1, :address2,
                                   :city, :state, :zipcode,
         crew_member_attributes: [ :name, :email,
                                   :password, :password_confirmation])
  end
end
