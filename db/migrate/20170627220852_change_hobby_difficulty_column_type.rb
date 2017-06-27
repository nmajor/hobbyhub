class ChangeHobbyDifficultyColumnType < ActiveRecord::Migration[5.0]
  def up
    change_column :hobbies, :difficulty, 'integer USING CAST(difficulty AS integer)'
  end

  def down
    change_column :hobbies, :difficulty, :string
  end
end
