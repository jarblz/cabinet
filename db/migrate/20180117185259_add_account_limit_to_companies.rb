class AddAccountLimitToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :account_limit, :integer, default: 5
  end
end
