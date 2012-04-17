class TwitterPost < Post
  include Twitter::Autolink

  def to_s
    auto_link(self.content).html_safe
  end
end
