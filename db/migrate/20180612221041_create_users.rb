class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :city
      t.string :state
      t.string :mini_bio
      t.integer :age

      t.timestamps
    end
  end
end
