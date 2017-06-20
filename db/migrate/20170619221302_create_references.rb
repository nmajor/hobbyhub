class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :ref
      t.string :desc
      t.string :type
      t.integer :hobby_id

      t.timestamps
    end
  end
end
