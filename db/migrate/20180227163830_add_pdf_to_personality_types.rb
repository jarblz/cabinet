class AddPdfToPersonalityTypes < ActiveRecord::Migration[5.0]
  def change
    add_attachment :personalities, :info
  end
end
