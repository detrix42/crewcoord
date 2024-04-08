
class CrewMember < ApplicationRecord
  has_secure_password
  belongs_to :business

  scope :crew_manager, -> (manager_email) {
    where(email: manager_email, is_crew_manager: true)
  }
end
