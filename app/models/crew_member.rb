
class CrewMember < ApplicationRecord
  has_secure_password
  # belongs_to :business

  validates :email, presence: true,
            uniqueness: { case_sensitive: false }
  validates :name, presence: true,
            uniqueness: { case_sensitive: false }

  scope :crew_manager, -> (manager_email) {
    where(email: manager_email, is_crew_manager: true)
  }

end
