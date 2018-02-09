class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name,              null: false, default: ""
      t.string :contact_email,              null: false, default: ""
      t.string :phone,              null: false, default: ""
      t.string :bio,              null: false, default: ""
      t.integer :status,           null: false, default: 0
      t.string :code,              null: false, default: ""
      t.timestamps null: false
    end
  end
end
