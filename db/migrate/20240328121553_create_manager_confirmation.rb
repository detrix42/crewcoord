class CreateManagerConfirmation < ActiveRecord::Migration[7.1]
  def change
    create_table :manager_confirmations do |t|
      t.string :manager_id # is a UUID
      t.string :token

      t.timestamps
    end
  end
end
