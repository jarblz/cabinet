class CreateCompanyTraits < ActiveRecord::Migration[5.0]
  def change
    create_table :company_traits do |t|
      t.integer :company_id,              null: false, default: ""
      t.integer :trait_id,              null: false, default: ""
    end
  end
end
