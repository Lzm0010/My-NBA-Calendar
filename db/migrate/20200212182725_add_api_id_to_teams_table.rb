class AddApiIdToTeamsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :api_id, :integer
  end
end
