class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |u|
      u.string :full_name
      u.string :user_name
      u.string :location
    end
  end
end

