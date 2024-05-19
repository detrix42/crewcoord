class CreatePasswordResetCodeTable < ActiveRecord::Migration[7.1]
  def change
    create_table :password_reset_codes do |t|
      t.string :code
      t.string :email

      t.timestamps
    end
  end
end
