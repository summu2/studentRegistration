class AtmServicesController < ApplicationController

  def get_money_change
    input_amount = params[:input_amount]
    error_msg=''
    unless ApplicationHelper.is_blank(input_amount)
      input_amount_sanitized = eval(input_amount)
      if input_amount_sanitized.is_a? Integer
        # input is a number
        if input_amount_sanitized.positive?
          response = AtmServicesHelper.change(input_amount_sanitized)
          render json: {success: true , data: response} and return
        else
          error_msg = "Input cannot be negative or zero"
        end
      else
        # input is not a number
        error_msg = "Input cannot be other than positive integer"
      end
    end
    render json: { error: error_msg }, :status => :bad_request and return
  end

end
