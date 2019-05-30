module ApplicationHelper
  def set_stars(rating)
    result = ""
    for i in 1..5
      if i > rating
        result << '<span class="star-icon">☆</span>'
      else
        result << '<span class="star-icon full">☆</span>'
      end
    end
    return result.html_safe
  end

  def truncate_and_link(text,options ={})
    length = options[:length]
    return text if length.blank?
    url = options[:url] || '#'
    output = raw text.truncate_words(length, omission: '')
    output += link_to(' ... (more)', url) if text.size > length
    output.html_safe
  end

  def inline_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg["class"] = options[:class]
    end
    doc.to_html.html_safe
  end

  def user_avatar(user)
    if user.avatar_url.nil?
      image_path 'geek.jpg'
    else
      user.avatar_url
    end
  end
end
