class AddPasswordDigestToCrewMember < ActiveRecord::Migration[7.1]
  def change
    add_column :crew_members, :password_digest, :string
  end
end
