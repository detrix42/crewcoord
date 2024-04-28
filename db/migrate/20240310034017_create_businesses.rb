class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses, id: :uuid do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
