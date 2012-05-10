module ApplicationHelper

  include Twitter::Autolink

  def video_tag id, width = 560, height = 190
    "<iframe width='#{width}' height='#{height}' src='http://www.youtube.com/embed/#{id}?enablejsapi=1&controls=1&showinfo=0&showsearch=0&modestbranding=1&html5=1' frameborder='0' allowfullscreen class='youtube-player' type='text/html'></iframe>"
  end

  def tweetize txt
  	if match = txt.match(/.*?(@)((?:\w+))(:|\s)/i)
  		user = match[2]
  		txt.gsub!(user, '<a href="http://twitter.com/' + user + '">' + user + '</a>')
  	end
  	txt.html_safe
  end

  def title(page_title, show_title = true)
    @show_title = show_title
    @content_for_title = page_title.to_s
  end

  def show_title?
    @show_title
  end

  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields button", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
