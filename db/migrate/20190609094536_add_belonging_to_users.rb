class AddBelongingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :belonging, :boolean
  end
end
