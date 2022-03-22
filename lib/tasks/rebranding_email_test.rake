namespace :rebranding_test do
  desc 'Send rebranding email to few users'
  task email_users: :environment do
    test_emails = ['vishal+1@bluebash.co', 'ritik.sharma@bluebash.co', 'nikita.bhatia@bluebash.co',
                   'villanivalerio33@gmail.com', 'vishal@bluebash.co', 'duccioarmenise@gmail.com']
    test_emails.each do |email_id|
      user = User.find_by(email: email_id)
      UserMailer.email_rebranding(user).deliver_now if user.present?
    end
  end
end
