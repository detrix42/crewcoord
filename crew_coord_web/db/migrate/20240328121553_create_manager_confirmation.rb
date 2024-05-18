class CreateManagerConfirmation < ActiveRecord::Migration[7.1]
  def change
    create_table :manager_confirmations do |t|
      t.integer :manager_id
      t.string :token

      t.timestamps
    end
  end
end
