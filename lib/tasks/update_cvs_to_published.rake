namespace :cvs do
  desc 'update confirmed users cv to published'
  task update_cvs_to_published: :environment do
    Cv.joins(:user).where('users.confirmed_at IS NOT NULL AND published = ?', false).each do |cv|
      cv.update_column(:published, true)
    end
  end
end
