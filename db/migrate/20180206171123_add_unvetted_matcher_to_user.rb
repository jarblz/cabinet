class AddUnvettedMatcherToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unvetted_matcher, :boolean
  end
end
