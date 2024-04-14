class RemoveForeignKeyFromCrewMember < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :crew_members, :businesses
  end
end
