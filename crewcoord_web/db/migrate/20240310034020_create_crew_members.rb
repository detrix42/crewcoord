class CreateCrewMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :crew_members, id: :uuid do |t|
      t.string :name
      t.string :email, index: true
      t.string :phone, index: true
      t.boolean :is_crew_manager, default: false

      t.references :business, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
