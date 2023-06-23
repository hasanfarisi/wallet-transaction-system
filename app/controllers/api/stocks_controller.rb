class Api::StocksController < ApplicationController
  before_action :authenticate_request!

  def price
    symbol = params[:symbol]
    price = latest_stock_price.price(symbol)
    render json: { symbol: symbol, price: price }
  end

  def prices
    symbols = params[:symbols]
    prices = latest_stock_price.prices(symbols)
    render json: prices
  end

  def price_all
    all_prices = latest_stock_price.price_all
    render json: { data: all_prices }
  end

  private

  def latest_stock_price
    @latest_stock_price ||= LatestStockPrice::Client.new
  end
end
