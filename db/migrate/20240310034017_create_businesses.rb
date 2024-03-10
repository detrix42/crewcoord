class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :crew_manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
