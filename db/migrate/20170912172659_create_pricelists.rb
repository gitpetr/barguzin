class CreatePricelists < ActiveRecord::Migration[5.1]
  def change
    create_table :pricelists do |t|
      t.date :pricelist_date
      t.integer :city_id

      t.timestamps
    end
  end
end
