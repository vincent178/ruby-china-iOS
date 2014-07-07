require 'pry'
require 'pry-nav'
require 'httparty'

# topics related
no_reply_topics_url = 'https://ruby-china.org/api/v2/topics?type=no_reply'
excellect_topics_url = 'https://ruby-china.org/api/v2/topics?type=excellent'


per_page_15_url = 'https://ruby-china.org/api/v2/topics?per_page=15&page=2'



# user related
user_info_url = 'https://ruby-china.org/api/users/vincent178.json'
user_topics_url = 'https://ruby-china.org/api/users/vincent178/topics.json?size=20'


# topic detail
topic_detail_url = 'https://ruby-china.org/api/v2/topics/1.json'

topic_detail = HTTParty.get(topic_detail_url)

binding.pry

