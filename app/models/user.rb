class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :timeoutable, :trackable, :validatable

  has_one :cv, dependent: :destroy
  has_many :locations, dependent: :destroy

  validates :first_name, :last_name, presence: true

  after_initialize :create_cv, if: :new_record?

  accepts_nested_attributes_for :cv

  private

  def create_cv
    self.cv ||= Cv.new
  end
end
