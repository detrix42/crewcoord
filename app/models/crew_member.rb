# == Schema Information
#
# Table name: crew_members
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CrewMember < ApplicationRecord
  belongs_to :crew
end
