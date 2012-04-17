class YoutubePost < Post

def to_s
  "<iframe width='374' height='210' src='http://www.youtube.com/embed/#{self.service_id}' frameborder='0' allowfullscreen></iframe>".html_safe
end

end
