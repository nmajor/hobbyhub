class CreateHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies do |t|
      t.string :name
      t.text :desc
      t.boolean :public
      t.string :difficulty
      t.integer :startingCost
      t.integer :repeatCost
      t.text :resources
      t.text :affiliateLinks
      t.text :videos

      t.timestamps
    end
  end
end
