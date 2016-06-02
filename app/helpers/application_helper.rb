module ApplicationHelper
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end
  def alert_string(alert)
    alert.is_a?(Array) ? safe_join(alert, "<br />".html_safe) : alert
  end
end
