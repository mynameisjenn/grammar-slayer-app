class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :content
      t.boolean :noun
      t.boolean :verb
      t.boolean :adjective
      t.boolean :pronoun
      t.boolean :preposition
      t.boolean :article
      t.boolean :conjunction
      t.boolean :adverb

      t.timestamps
    end
  end
end
