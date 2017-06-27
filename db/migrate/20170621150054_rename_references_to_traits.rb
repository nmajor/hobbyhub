class RenameReferencesToTraits < ActiveRecord::Migration[5.0]
  def change
    rename_table :references, :traits
  end
end
