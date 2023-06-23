require 'httparty'

module LatestStockPrice
  class Client
    include HTTParty
    base_uri 'https://latest-stock-price.p.rapidapi.com'
    headers 'X-RapidAPI-Key' => 'd0b1e9ecf6mshb59428ff02a304dp1e59b5jsnd3288ba39434'

    def price(symbol)
      response = self.class.get('/price', query: { Indices: symbol })
      handle_response(response)
    end


    def prices(symbols)
      response = self.class.get('/price', query: { Indices: symbols })
      handle_response(response)
    end

    def price_all
      response = self.class.get('/any')
      handle_response(response)
    end

    private

    def handle_response(response)
      unless response.success?
        raise "Failed to fetch data: #{response.code}"
      end
      JSON.parse(response.body)
    end
  end
end
