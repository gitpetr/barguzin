class CreateGroupsCounterparties < ActiveRecord::Migration[5.1]
  def change
    create_table :groups_counterparties do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
