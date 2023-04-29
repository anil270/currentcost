require 'nokogiri'
require 'httparty'

class PriceController < ApplicationController
  def get_price
    begin
      # Scrape the webpage and extract the latest price
      page = Nokogiri::HTML(HTTParty.get('https://www.metal.com/Lithium-ion-Battery/202303240001').body)
    
      price = page.css(".block___2RfAT").text.strip
  
      # Return the latest price in JSON format
      render json: { price: price }
    rescue
      # Handle any errors that may occur during the web scraping process and return an error message
      render json: { error: 'Unable to retrieve the latest price' }
    end
  end
end
