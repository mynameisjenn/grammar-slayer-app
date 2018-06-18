class CreateGamePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :game_plays do |t|
      t.integer :user_id
      t.integer :score
      t.integer :level

      t.timestamps
    end
  end
end
