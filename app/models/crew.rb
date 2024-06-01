# == Schema Information
#
# Table name: crews
#
#  id             :bigint           not null, primary key
#  business_id    :bigint           not null
#  crew_member_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Crew < ApplicationRecord
  belongs_to :business
  has_many :crew_member

end
