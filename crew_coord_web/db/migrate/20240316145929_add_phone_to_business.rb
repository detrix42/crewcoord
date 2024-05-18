class AddPhoneToBusiness < ActiveRecord::Migration[7.1]
  def change
    add_column :businesses, :phone, :string
  end
end
