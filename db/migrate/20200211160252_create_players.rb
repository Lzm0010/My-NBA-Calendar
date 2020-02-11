class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :team_id
      t.string :college
      t.integer :age
      t.string :number
      t.string :position
      t.string :height
      t.string :weight
      t.integer :startNba
    end
  end
end
