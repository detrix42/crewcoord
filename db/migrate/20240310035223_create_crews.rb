class CreateCrews < ActiveRecord::Migration[7.1]
  def change
    create_table :crews, id: :uuid do |t|
      t.references :business, type: :uuid, null: false, foreign_key: true
      t.references :crew_member, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
