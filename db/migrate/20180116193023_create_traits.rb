class CreateTraits < ActiveRecord::Migration[5.0]
  def change
    create_table :traits do |t|
      t.string :name
      t.boolean :is_recruiter
      t.text :description

      t.timestamps
    end
  end
end
