class AddIdeaStatusToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :idea_status, :boolean, default: true
  end
end
