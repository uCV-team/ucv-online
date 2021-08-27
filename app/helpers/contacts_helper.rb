module ContactsHelper
  def contact_label(contact)
    case contact.status
    when 'new'
      content_tag(:span, 'NEW',  class: 'badge badge-success')
    when 'spam'
      content_tag(:span, 'SPAM', class: 'badge badge-danger')
    end
  end
end
