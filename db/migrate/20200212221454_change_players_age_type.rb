class ChangePlayersAgeType < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :age, :string
  end
end
