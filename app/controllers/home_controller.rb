class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:napthe]
  
  def index
  end

  def napthe
    puts card_params
    zingpay = ZingPay.new(username: "nnbcndo300", password: "qweqwe")
    result = zingpay.main(card_params[:serial], card_params[:number])
    render :json => {data: result,}
  end

  private
  def card_params
    params.permit(:serial, :number)
  end
end
