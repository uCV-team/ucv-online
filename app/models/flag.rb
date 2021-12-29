class Flag < ApplicationRecord
  FLAG_SCORE = 10
  DATATABLE_COLUMNS = %w[cv_id user_id reason created_at].freeze
  belongs_to :cv
  belongs_to :user

  validates :reason, presence: true, length: { maximum: 40 }

  after_save :unpublish_cv

  # Unpublish User's CV if the flag count is more than 10
  def unpublish_cv
    cv.update(published: false) if cv.flags.count > FLAG_SCORE
  end

  def self.datatable_filter(search_value, search_columns)
    return all if search_value.blank?

    result = none
    search_columns.each do |key, value|
      if value['searchable'] == 'true'
        filter = where("#{DATATABLE_COLUMNS[key.to_i]} ILIKE ?", "%#{search_value}%")
        result = result.or(filter)
      end
    end
    result
  end

  def self.datatable_order(order_column_index, order_dir)
    order("#{DATATABLE_COLUMNS[order_column_index]} #{order_dir}")
  end
end
