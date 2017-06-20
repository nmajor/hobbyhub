class AddSlugToHobbies < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :slug, :string
    add_index :hobbies, :slug
  end
end
