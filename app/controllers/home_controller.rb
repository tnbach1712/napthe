class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:napthe]
  
  def index
  end

  def napthe
    puts card_params
    seri = params[:seri] || params[:serial]
    zingpay = ZingPay.new(username: "nnbcndo300", password: "qweqwe")
    result = zingpay.main(seri, params[:number])
    # render :json => result
    
    render plain: result.to_json
  end

  private
  def card_params
    params.permit(:serial, :number, :seri)
  end
end
