class CreateUserTraits < ActiveRecord::Migration[5.0]
  def change
    create_table :user_traits do |t|
      t.integer :user_id
      t.integer :trait_id
    end
  end
end
