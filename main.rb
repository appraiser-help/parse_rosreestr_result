# url_2020 = 'https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=62317'
# url_2019 = 'https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243'

require 'nokogiri'
require 'faraday'
require 'uri'

@conn = Faraday.new do |connection|
  connection.adapter Faraday.default_adapter # net/http
  connection.headers['User-Agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36'
  connection.headers['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
  connection.headers['Accept-Language'] = 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7'
  connection.headers['Connection'] = 'keep-alive'
end

def parse_month_link(url)
  page = Nokogiri::HTML(url)
  response = @conn.get(url)
  page =  Nokogiri::HTML(response.body)
  page.css('.main_colum a').map { |a| "https://rosreestr.ru#{a['href']}"  }.select { |a| a.include?('.docx') || a.include?('.doc') || a.include?('.xlsx') || a.include?('.xls') }
end

def parse_decision_link(url)
  page = Nokogiri::HTML(url)
  response = @conn.get(url)
  page =  Nokogiri::HTML(response.body)
  page.css('.regional-elements li a').map { |a| "https://rosreestr.ru#{a['href']}"  }
end

# parse_month_link(url_2020)
# parse_month_link(url_2019)
urls = [
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=62317&r_elem=264029",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=62317&r_elem=267237",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=197892",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=204602",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=212312",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=218361",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=222393",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=227690",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=238849",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=241284",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=244090",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=246461",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=250333",
  "https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=48243&r_elem=256453",  
]

urls.each do |mounth_url|
  parse_month_link(mounth_url).each do |url|
    filename = url.split('/').last

    unless File.exists?(filename)
      puts "url: #{url} #{filename}"
      page = @conn.get(URI::encode(url))
      body = page.body
    
      out_file = File.new("downloads/#{filename}", "w")
      out_file.puts(body)
      out_file.close
    
      puts "Saved ...."    
    end
  end
end

# https://rosreestr.ru/site/activity/kadastrovaya-otsenka/rassmotrenie-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimosti-/informatsiya-o-rabote-komissiy-po-rassmotreniyu-sporov-o-rezultatakh-opredeleniya-kadastrovoy-stoimo/?r_sect=62317&r_elem=264029