class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :timeoutable, :trackable, :validatable, :confirmable

  has_one :cv, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :contacts, dependent: :destroy

  has_one :current_location, dependent: :destroy, class_name: 'Location'

  validates :first_name, :last_name, :subdomain, presence: true
  validates :subdomain, uniqueness: true

  # TODO: Validate format of domain
  # validates_format_of :subdomain, :with => Regexp.new(/^[a-zA-Z0-9-]*?$/), :message => "as"

  after_initialize :prepare_blank_cv, if: :new_record?
  before_create :format_subdomain

  accepts_nested_attributes_for :cv
  accepts_nested_attributes_for :current_location, reject_if: proc { |attributes| attributes['id'].blank? && attributes['original_address'].blank? }

  def cv_public_domain
    domain_suffix = locale.present? ? (locale == 'en' ? 'org' : locale) : 'org'
    "#{subdomain}.publicv.#{domain_suffix}"
  end

  def cv_public_url
    "http://#{cv_public_domain}"
  end

  private

  def prepare_blank_cv
    self.cv ||= Cv.new
  end

  def format_subdomain
    self.subdomain = subdomain.downcase
  end
end
