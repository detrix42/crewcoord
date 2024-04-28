class ChangeManagerIdToString < ActiveRecord::Migration[7.1]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    add_column :crew_members, :uuid, :string, default: 'gen_randome_uuid()'
    execute("UPDATE crew_members SET uuid = gen_random_uuid()")
    remove_column :crew_members, :id, cascade: true
    rename_column :crew_members, :uuid, :id
    execute "ALTER TABLE crew_members ADD PRIMARY KEY (uuid);"
  end

  def down
    execute "ALTER TABLE crew_members DROP CONSTRAINT crew_members_pkey;"
    rename_column :crew_members, :id, :uuid
    add_column :crew_members, :id, :primary_key
    execute "UPDATE TABLE crew_members SET id = uuid_generate_v4();"
    remove_column :crew_members, :uuid
  end
end
