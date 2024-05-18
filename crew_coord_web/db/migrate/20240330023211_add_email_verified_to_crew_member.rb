class AddEmailVerifiedToCrewMember < ActiveRecord::Migration[7.1]
  def change
    add_column :crew_members, :email_verified,
               :boolean, default: false
  end
end
