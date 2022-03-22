namespace :rebranding do
  desc 'Send rebranding email to all users'
  task email_all_users: :environment do
    User.where(locale: 'it').each do |user|
      UserMailer.email_rebranding(user).deliver_now
    end
  end
end
