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

  accepts_nested_attributes_for :cv, :current_location

  def cv_public_url
    domain_suffix = locale == 'en' ? 'org' : locale
    "#{subdomain}.publicv.#{domain_suffix}"
  end

  private

  def prepare_blank_cv
    self.cv ||= Cv.new
  end

  # Allow unconfirmed users to use application
  def confirmation_required?
    false
  end
end
