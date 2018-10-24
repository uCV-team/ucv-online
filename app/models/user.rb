class User < ApplicationRecord
  has_one :cv, dependent: :destroy

  after_initialize :create_cv, if: :new_record?

  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :timeoutable, :trackable, :validatable
  validates :first_name, :last_name, presence: true

  private

  def create_cv
    self.cv = Cv.new
  end
end
