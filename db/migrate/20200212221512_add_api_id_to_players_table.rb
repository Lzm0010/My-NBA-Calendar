class AddApiIdToPlayersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :api_id, :integer
  end
end
