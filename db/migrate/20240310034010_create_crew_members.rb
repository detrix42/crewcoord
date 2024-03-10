class CreateCrewMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :crew_members do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
