require 'json'
require 'open-uri'

namespace :fetch do
  desc "From Twitter"
  task :twitter => :environment do
    results = JSON.parse(open("https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=bitsushi&count=10").read)
    results.each do |result|
      begin
        TwitterPost.create(content: result['text'], service_id: result['id'], posted_at: result['created_at'])
      rescue
        p "already added"
      end
    end
  end

  task :youtube => :environment do
    results = JSON.parse(open("http://gdata.youtube.com/feeds/base/users/IndieChatter/uploads?alt=json&amp;v=2&amp;orderby=published&amp;client=ytapi-youtube-profile").read)
    results['feed']['entry'].each do |result|
      begin
        if result['link'][0]['href'].present?
          p result['link'][0]['href']
          YoutubePost.create(content: result['title']['$t'], service_id: result['link'][0]['href'].gsub(/^[^v]+v.(.{11}).*/,"#{$1}"), posted_at: result['published']['$t'], url: result['link'][0]['href'])
        end
      rescue
        p "already added"
      end
    end
  end

  task :activities => :environment do
    %w[twitter youtube].each do |task|
      Rake::Task["fetch:#{task}"].execute
    end
  end
end
