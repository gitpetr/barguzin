class CreateCounterparties < ActiveRecord::Migration[5.1]
  def change
    create_table :counterparties do |t|
      t.string :name
      t.text :comment
      t.references :groups_counterparty, foreign_key: true

      t.timestamps
    end
  end
end
