class RemoveTypeAddBonus < ActiveRecord::Migration[5.1]
  def change
    remove_column :tracks, :type
    add_column :tracks, :bonus, :string, default: "Regular", null: false
  end
end
