class CreateUserteams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_teams do |ut|
      ut.integer :user_id
      ut.integer :team_id
    end
  end
end
