class StockController < ApplicationController
  def show
    id = params[:id].to_i
    span = params[:span] ? params[:span].to_i : 100
    @stocks = Stock.order("code DESC").all[id*span..id*span+(span-1)]
  end
end
