class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      # didn't do this t.integer "id"
      t.string "name"
      t.string "city"
      t.string "state"
      t.string "url"

      # t.timestamps
    end
  end
end
