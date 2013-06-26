class StockController < ApplicationController

  def show
    id = params[:id].to_i
    @stocks = Stock.order("code DESC").all[id*100..id*100+99]
  end

  def info
    @stock = Stock.find_by_code(params[:id].to_i)
  end
  def test
    start = Time.now.strftime("%M").to_i
    Stock.all[start*59..(start+1)*59].each do |stock|
      @stockCode = stock.code
      html = Stock.convert("http://stocks.finance.yahoo.co.jp/stocks/detail/?code=#{@stockCode}")
      date = html.css('div.innerDate dd').map{|x| x.css('strong').inner_text }
      #yahoo
      yahoo = Stock.convert("http://kabu-sokuhou.com/brand/item/code___" + stock.code.to_s).css("div#yahoo_item_block")[0]
      yahoo = yahoo.css("div.s_res").to_html unless yahoo.nil?
      #twitter
      url = URI.encode("http://t-proj.net/twitter/?q=" + stock.name)
      twitter = Stock.convert(url).css("div.twitter_status")
      twitter = twitter.to_html unless twitter.nil?
      stock.update_attributes(
        previousprice: date[0],
        opening: date[1],
        high: date[2],
        low: date[3],
        volume: date[4],
        price: html.css('table.stocksTable td.stoksPrice')[1].content,
        name: html.css('table.stocksTable th.symbol h1').inner_text,
        market: html.css('div.stocksDtlWp dd')[0].content,
        chart: html.css("div.styleChart img")[0][:src],
        yahoo: yahoo,
        twitter: twitter
        )
      stock.save
    end
  end
  def self.convert(url)
    begin
      page = open(url)
    rescue OpenURI::HTTPError
      return
    end
    doc = Nokogiri::HTML(page.read, nil, 'utf-8')
  end
	def tanaka
		@stock = Stock.find(params[:id])

    url = "http://stocks.finance.yahoo.co.jp/stocks/detail/?code=8411"
    begin
      page = open(url)
    rescue OpenURI::HTTPError
      return
    end
    html = Nokogiri::HTML(page.read, nil, 'utf-8')
    @doc = html.css("div.styleChart img")[0][:src]

    url = "http://kabu-sokuhou.com/brand/item/code___" + @stock.code.to_s
    begin
      page = open(url)
    rescue OpenURI::HTTPError
      return
    end
    html = Nokogiri::HTML(page.read, nil, 'utf-8')
    @yahoo = html.css("div#yahoo_item_block")[0].css("div.s_res").map{|x|
      [
        x.css("span.yahoo_title").inner_text,
        x.css("p.res_head")[0].inner_text.split(nil)[1],
        x.css("span")[1].inner_text,
        x.css("span")[2].inner_text,
        x.css("div.this_comment p")[0].to_html
      ]
    }

    url = URI.encode("http://t-proj.net/twitter/?q=" + @stock.name)
    begin
      page = open(url)
    rescue OpenURI::HTTPError
      return
    end
    html = Nokogiri::HTML(page.read)
    doc = html.css("div.twitter_status")
    @twitter = doc[2..doc.length-3].map{|x|
      [
        x.css("img")[0].to_html,
        x.inner_text.split("From")[0]
      ]
    }
    
	end

  def search
    words = params[:words].gsub(/　/," ").split(nil)
    @search_stocks = []
    words.each do |word|
      @search_stocks += Stock.where("name LIKE :word OR code LIKE :word", word: "%#{word}%")
    end
    @search_stocks.uniq!
  end
end
