class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :registerable, :rememberable,
         :timeoutable, :trackable, :validatable, :confirmable

  has_one :cv, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :flags, dependent: :destroy

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
