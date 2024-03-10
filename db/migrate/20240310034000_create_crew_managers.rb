class CreateCrewManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :crew_managers do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.index :email, unique: true

      t.timestamps
    end
  end
end
