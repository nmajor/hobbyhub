class RenameHobbyCostColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :hobbies, :startingCost, :starting_cost
    rename_column :hobbies, :repeatCost, :repeat_cost
  end
end
