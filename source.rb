require 'curb'

... # Arby stuff...

yelp_url = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a'
http     = Curl.get(yelp_url)
html     = http.body_str

... # Arby stuff...

require 'curb'
require 'nokogiri'

... # Arby stuff...

yelp_url = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a'
http     = Curl.get(yelp_url)
html     = Nokogiri::HTML(http.body_str)

... # Arby stuff...

require 'curb'
require 'nokogiri'

... # Arby stuff...

yelp_url = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a'
http     = Curl.get(yelp_url)
html     = Nokogiri::HTML(http.body_str)

a_tags = html.css('div.biz-listing-large span.indexed-biz-name a.biz-name')

... # Arby stuff...

require 'curb'
require 'nokogiri'

... # Arby stuff...

yelp_url = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a'
http     = Curl.get(yelp_url)
html     = Nokogiri::HTML(http.body_str)

a_tags = html.css('div.biz-listing-large span.indexed-biz-name a.biz-name')

yelp_root_url = 'http://www.yelp.com'

urls = a_tags.collect do |tag|
  yelp_root_url + tag.attributes[:href].value
end

random_generator = Random.new
index            = random_generator(urls.length)

random_bar_url = urls[index]
# YAY NOW SEND IT TO CAMPFIRE!!!!

... # Arby stuff...

require 'curb'
require 'nokogiri'

... # Arby stuff...

urls = []


yelp_root_url = 'http://www.yelp.com'
yelp_url      = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a#start='
paged_count   = 0

while page_count < 100 do
  paged_url = yelp_url + paged_count.to_s

  http = Curl.get(paged_url)
  html = Nokogiri::HTML(http.body_str)

  a_tags = html.css('div.biz-listing-large span.indexed-biz-name a.biz-name')

  urls += a_tags.collect do |tag|
    yelp_root_url + tag.attributes[:href].value
  end

  paged_count += 10
end

random_generator = Random.new
index            = random_generator(urls.length)

random_bar_url = urls[index]
# YAY NOW SEND IT TO CAMPFIRE!!!!

... # Arby stuff...

require 'json' # You may need this if Ruby complains about JSON.
require 'watir'

... # Arby stuff...

urls = []

yelp_url      = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a#start='
paged_count   = 0

browser  = Watir::Browser.new

while paged_count < 100 do
  paged_url = "#{yelp_url}#{paged_count}"
  browser.goto paged_url

  a_tags = browser.links :class => 'biz-name'
  urls   += a_tags.collect do |tag|
    tag.href
  end

  paged_count += 10
end

browser.close

random_generator = Random.new
index            = random_generator(urls.length)

random_bar_url = urls[index]
# YAY NOW SEND IT TO CAMPFIRE!!!!
... # Arby stuff...

require 'json' # You may need this is Ruby complains about JSON.
require 'watir'

... # Arby stuff...

urls = []

yelp_url      = 'http://www.yelp.com/search?find_desc=bars&find_loc=Kendall+Square%2C+Boston%2C+MA&ns=1&ls=3ae4c232948e275a#start='
paged_count   = 0

browser  = Watir::Browser.new

while paged_count < 100 do
  paged_url = "#{yelp_bar_url}#{page_count}"
  browser.goto paged_url

  loading_div = browser.div :class => 'yelp-spinner'
  Watir::Wait.until do
    loading_div.display.nil?
  end

  span_tag = browser.span :class => 'indexed-biz-name'
  span_tag.wait_until_present

  a_tags = browser.links :class => 'biz-name'
  urls   += a_tags.collect do |tag|
    tag.href
  end

  paged_count += 10
end

browser.close

random_generator = Random.new
index            = random_generator(urls.length)

random_bar_url = urls[index]
# YAY NOW SEND IT TO CAMPFIRE!!!!

... # Arby stuff...
