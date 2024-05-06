class CreateShards < ActiveRecord::Migration[7.1]
  def change
    create_table :shards, id: :uuid do |t|
      t.references :crew_member, type: :uuid, null: false, foreign_key: true
      t.string :number
      t.string :exp_date

      t.timestamps
    end
  end
end
