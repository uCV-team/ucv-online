module MessagesHelper
  def message_label(message)
    case message.status
    when 'new'
      content_tag(:span, 'NEW',  class: 'badge badge-success')
    when 'open'
      content_tag(:span, 'OPEN', class: 'badge badge-warning')
    when 'spam'
      content_tag(:span, 'SPAM', class: 'badge badge-danger')
    end
  end
end
