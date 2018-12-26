class StockcontrollerTwoController < ApplicationController
  def history
    @username=session[:name]
    @picture_path=session[:picture_path]
  end

  def report
    @username2=session[:name]
    @picture_path=session[:picture_path]
    @average=session[:average]
    @variance=session[:variance]
    @SP500=session[:SP500]
    @transaction=session[:transaction]
    @profit=session[:profit]
    @summary=session[:summary]
  end
end
