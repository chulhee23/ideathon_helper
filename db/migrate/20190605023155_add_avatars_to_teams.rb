class AddAvatarsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :avatars, :string
  end
end
