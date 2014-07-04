require 'pry'
require 'pry-nav'
require 'httparty'


no_replys = HTTParty.get('https://ruby-china.org/api/v2/topics?type=no_reply')
excellent = HTTParty.get('https://ruby-china.org/api/v2/topics?type=excellent')
page_15 = HTTParty.get('https://ruby-china.org/api/v2/topics?per_page=15&page=2')


user = HTTParty.get('https://ruby-china.org/api/users/as181920.json')
user_topics = HTTParty.get('https://ruby-china.org/api/users/as181920/topics.json?size=20')

binding.pry

