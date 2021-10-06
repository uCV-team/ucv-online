class User < ApplicationRecord
  DATATABLE_COLUMNS = %w[email first_name tel subdomain created_at].freeze
  devise :database_authenticatable, :recoverable, :registerable, :rememberable,
         :timeoutable, :trackable, :validatable, :confirmable

  has_one :cv, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :flags, dependent: :destroy
  has_and_belongs_to_many :roles

  has_one :current_location, dependent: :destroy, class_name: 'Location'

  validates :first_name, :last_name, presence: true
  validates :subdomain, presence: true, uniqueness: true, subdomain: true, on: :update

  after_initialize :prepare_blank_cv, if: :new_record?
  before_create :set_subdomain

  accepts_nested_attributes_for :cv
  accepts_nested_attributes_for :current_location, reject_if: proc { |attributes|
                                                                attributes['id'].blank? &&
                                                                  attributes['original_address'].blank?
                                                              }

  def cv_public_domain
    domain_suffix = if locale.present?
                      (locale == 'en' ? 'org' : locale)
                    else
                      'org'
                    end
    "#{subdomain}.publicv.#{domain_suffix}"
  end

  def cv_public_url
    "http://#{cv_public_domain}"
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

  def has_role?(user_role)
    roles.any? { |role| role.name == user_role }
  end

  private

  def prepare_blank_cv
    self.cv ||= Cv.new
  end

  def set_subdomain
    self.subdomain = loop do
      unique_subdomain = (first_name.downcase + rand.to_s[2..4]).to_s.tr('.', '-')
      break unique_subdomain unless self.class.exists?(subdomain: unique_subdomain)
    end
  end
end
