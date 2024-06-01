require 'stripe'

class CreditCardController < ApplicationController
  before_action :set_stripe_api_key

  def validate
    cc_info = card_info
    expdate = cc_info['expiration_date']
    dateRegex = /\d{2}[\/](\d{2]|\d{4})/
    year = nil

    month = expdate[0...2]
    if expdate.match?(dateRegex)
      if expdate.length == 2
        year = expdate[-2..-1]
      else
        year = expdate[-4..-1]
      end
    else

    end
    card = {
      :number => cc_info.number,
      :exp_month => expdate[0..1],
      :exp_year => year,
      :cvc => cc_info.cvv
    }

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  private
  def card_info
    params.require(:credit_card).permit(:number, :expiration_date, :cvv)
  end

  def set_stripe_api_key
    @api_key = Rails.application.config.stripe_api_key
  end
end
