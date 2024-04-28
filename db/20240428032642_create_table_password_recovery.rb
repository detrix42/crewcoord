class CreateTablePasswordRecovery < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :table_password_recoveries, id: :uuid do |t|
      t.string :token
      t.string :manager_id

      t.timestamps
    end
  end
end
