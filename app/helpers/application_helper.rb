module ApplicationHelper

  def video_tag id
    "<iframe width='560' height='190' src='http://www.youtube.com/embed/#{id}' frameborder='0' allowfullscreen></iframe>"
  end

  def tweetize txt
  	if match = txt.match(/.*?(@)((?:\w+))(:|\s)/i)
  		user = match[2]
  		txt.gsub!(user, '<a href="http://twitter.com/' + user + '">' + user + '</a>')
  	end
  	txt.html_safe
  end

end
