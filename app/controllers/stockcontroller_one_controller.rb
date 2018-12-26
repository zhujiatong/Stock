class StockcontrollerOneController < ApplicationController
  def new
    @username=session[:name]
  end

  def create
    @username=session[:name]
    stock=Stockmodel.find_by(name: stock_params[:stockname])
    if stock
      session[:picture_path]=stock.picture
      session[:average]=stock.average
      session[:variance]=stock.variance
      session[:SP500]=stock.SP500
      session[:transaction]=stock.trade
      session[:profit]=stock.profit
      session[:summary]=stock.summary
      redirect_to :stockcontroller_two_history
    else
      flash[:name_error]="11111"
      render"new"
    end
  end
  private
  def stock_params
    params.permit(:stockname)
  end
end
