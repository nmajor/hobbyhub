class RemoveHobbyLinkableAttributes < ActiveRecord::Migration[5.0]
  def up
    remove_column :hobbies, :resources
    remove_column :hobbies, :affiliateLinks
    remove_column :hobbies, :videos
  end

  def down
    add_column :hobbies, :resources, :text
    add_column :hobbies, :affiliateLinks, :text
    add_column :hobbies, :videos, :texts
  end
end
