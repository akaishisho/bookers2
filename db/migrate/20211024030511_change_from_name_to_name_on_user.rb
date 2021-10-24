class ChangeFromNameToNameOnUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, unique: true
    add_index :users, :name, unique: true
  end
end
