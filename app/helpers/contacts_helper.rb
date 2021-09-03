module ContactsHelper
  def contact_label(contact)
    case contact.status
    when 'new'
      content_tag(:span, 'NEW',  class: 'badge badge-success')
    when 'open'
      content_tag(:span, 'OPEN', class: 'badge badge-warning')
    when 'spam'
      content_tag(:span, 'SPAM', class: 'badge badge-danger')
    when 'not a spam'
      content_tag(:span, 'NOT A SPAM', class: 'badge badge-info')
    end
  end
end
