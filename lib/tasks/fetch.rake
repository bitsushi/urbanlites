require 'json'
require 'open-uri'

namespace :fetch do
  desc "From Twitter"
  task :twitter => :environment do
    results = JSON.parse(open("https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=urbanlites&count=10").read)
    results.each do |result|
      # begin

        begin
          media = result['entities']['media'][0]['media_url']
        rescue
          media = nil
        end

        begin
          Tweet.create(body: result['text'], uid: result['id'], posted_at: result['created_at'], media: media)
        rescue
          "TWITTER: Already have #{result['id']}"
        end
      # rescue
      #   p "already added"
      # end
    end
  end

  task :youtube => :environment do
    results = JSON.parse(open("http://gdata.youtube.com/feeds/base/users/urbanlitesuk/uploads?alt=json&amp;v=2&amp;orderby=published&amp;client=ytapi-youtube-profile").read)
    results['feed']['entry'].each do |result|
      begin
        if result['link'][0]['href'].present?
          p result['link'][0]['href']
          Video.create(
            name: result['title']['$t'],
            uid: result['id']['$t'].split('/').pop(),
            published_at: result['published']['$t']
            #result['link'][0]['href'].gsub(/^[^v]+v.(.{11}).*/,"#{$1}"),
            # url: result['link'][0]['href']
          )
        end
      rescue
        "YT: Already have #{result['id']}"
      end
    end
  end

  task :facebook => :environment do
    # https://www.facebook.com/feeds/page.php?format=json&id=187072201335959
    results = JSON.parse(open("https://www.facebook.com/feeds/page.php?format=json&id=187072201335959").read)
    results['entries'].each do |result|
      begin
        FacebookPost.create(content: result['content'], uid: result['id'], posted_at: result['published'], url: result['alternate'])
      rescue
        "FB: Already have #{result['id']}"
      end
    end
  end

  task :all => :environment do
    %w[twitter youtube facebook].each do |task|
      Rake::Task["fetch:#{task}"].execute
    end
  end
end
