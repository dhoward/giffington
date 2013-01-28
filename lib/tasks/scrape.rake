require 'open-uri'

namespace :scrape do
  desc "Get the top gifs from reddit"
  task :reddit => :environment do
    
    base_url = "http://www.reddit.com/top.json?limit=100&after="
    after_name = ""
    
    (1...10).each do |i|
      buffer = open(base_url+after_name).read
      result = JSON.parse(buffer)
    
      result["data"]["children"].each do |post|
        if /([^\s]+(\.(?i)(gif))$)/.match(post["data"]["url"])
          puts(post["data"]["url"])
          Gif.find_or_create_by_url(post["data"]["url"]){ 
            |g| g.source = "Reddit" 
                g.moderated = false
            }
          after_name = post["data"]["name"]
        end
      end
    end
    
    puts("REACTIONGIFS")
    
    base_url = "http://www.reddit.com/r/reactiongifs.json?limit=100&after="
    after_name = ""
    
    (1...10).each do |i|
      buffer = open(base_url+after_name).read
      result = JSON.parse(buffer)
    
      result["data"]["children"].each do |post|
        if /([^\s]+(\.(?i)(gif))$)/.match(post["data"]["url"])
          puts(post["data"]["url"])
          Gif.find_or_create_by_url(post["data"]["url"]){ |g| g.source = "Reddit" }
          after_name = post["data"]["name"]
        end
      end
    end
    
  end
end