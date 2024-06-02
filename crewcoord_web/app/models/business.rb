# == Schema Information
#
# Table name: businesses
#
#  id              :bigint           not null, primary key
#  name            :string
#  address1        :string
#  address2        :string
#  city            :string
#  state           :string
#  zipcode         :string
#  crew_manager_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Business < ApplicationRecord
  has_one :crew_member
  has_many :crews, dependent: :destroy
  accepts_nested_attributes_for :crew_member,
                                reject_if: :all_blank,
                                allow_destroy: true
end
