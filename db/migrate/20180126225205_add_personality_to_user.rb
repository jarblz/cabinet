class AddPersonalityToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :personality_id, :integer
  end
end
