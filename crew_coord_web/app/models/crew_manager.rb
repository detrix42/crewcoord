# == Schema Information
#
# Table name: crew_managers
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CrewManager < ApplicationRecord
  has_secure_password
  has_one :business, inverse_of: :crew_manager
end
