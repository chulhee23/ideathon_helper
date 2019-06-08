class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.boolean :secret
      t.text :body
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
