namespace :experiences do
  desc 'update positions in experiences of CVs'
  task update_experiences_position: :environment do
    Cv.where(custom_experience_sort: false).each do |cv|
      experiences = cv.experiences.order('created_at asc')
      experiences.each_with_index do |experience, index|
        experience.update_column(:position, index)
      end
    end
  end
end
