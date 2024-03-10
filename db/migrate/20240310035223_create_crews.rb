class CreateCrews < ActiveRecord::Migration[7.1]
  def change
    create_table :crews do |t|
      t.references :business, null: false, foreign_key: true
      t.references :crew_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
